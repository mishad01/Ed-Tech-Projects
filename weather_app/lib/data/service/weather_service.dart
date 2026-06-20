import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../core/app_strings.dart';
import '../../domain/entities/daily_weather.dart';
import '../../domain/entities/hourly_weather.dart';
import '../../domain/entities/weather_result.dart';
import '../model/daily_weather_model.dart';
import '../model/hourly_weather_model.dart';
import '../model/weather_model.dart';

// The only class in the app that talks to the network.
// Everything outside this file works with domain entities — never raw JSON or status codes.
class WeatherService {
  // Step 1 — convert a city name to coordinates.
  // Open-Meteo's weather API needs lat/lon, not a city name,
  // so we hit the geocoding API first to get them.
  // Returns null if the city doesn't exist in the database.
  Future<Map<String, dynamic>?> getCityLocation(String city) async {
    final url = Uri.parse(
      '${AppStrings.geocodingBaseUrl}?name=${Uri.encodeComponent(city)}&count=1',
    );

    final response = await http.get(
      url,
      headers: {'accept': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch city coordinates');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final results = json['results'] as List?;
    if (results == null || results.isEmpty) return null;
    final location = results[0] as Map<String, dynamic>;
    return {
      'name': location['name'] as String,
      'country': location['country'] as String,
      'latitude': (location['latitude'] as num).toDouble(),
      'longitude': (location['longitude'] as num).toDouble(),
    };
  }

  // Step 2 — fetch current + hourly + daily weather in a single API call.
  // We request all three in one request to avoid three separate network round-trips.
  // compute() runs the JSON decoding on a background isolate — the response body
  // can be large and decoding it on the main thread would cause frame drops.
  Future<WeatherResult> getWeather(double lat, double lon) async {
    final url = Uri.parse(
      '${AppStrings.weatherBaseUrl}'
      '?latitude=$lat&longitude=$lon'
      '&current=temperature_2m,wind_speed_10m,weather_code'
      '&hourly=temperature_2m,weather_code'
      '&daily=temperature_2m_max,temperature_2m_min,weather_code'
      '&timezone=auto&forecast_days=10',
    );

    debugPrint('Fetching weather: $url');
    final response = await http.get(
      url,
      headers: {'accept': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch weather data');
    }
    final json = await compute(_decodeJson, response.body);
    return WeatherResult(
      current: WeatherModel.fromJson(
        json['current'] as Map<String, dynamic>,
        // daily is also passed because today's high/low lives in daily[0], not in current
        json['daily'] as Map<String, dynamic>,
      ),
      hourly: _parseHourlyWeather(json),
      daily: _parseDailyWeather(json),
    );
  }

  // Top-level static function required by compute() —
  // compute() spawns an isolate and isolates can only call static/top-level functions.
  static Map<String, dynamic> _decodeJson(String body) =>
      jsonDecode(body) as Map<String, dynamic>;

  // Open-Meteo returns 240 hourly entries (10 days × 24h).
  // We find the current hour in the array and slice the next 24 from there
  // so the scroll always starts from "Now" rather than midnight of day 1.
  List<HourlyWeather> _parseHourlyWeather(Map<String, dynamic> json) {
    final hourly = json['hourly'] as Map<String, dynamic>;
    final times = hourly['time'] as List;
    final temps = hourly['temperature_2m'] as List;
    final codes = hourly['weather_code'] as List;
    final currentTime =
        (json['current'] as Map<String, dynamic>)['time'] as String;

    // Truncate current time to the hour so it aligns with the hourly array entries
    final currentDt = DateTime.parse(currentTime);
    final currentHour = DateTime(
      currentDt.year,
      currentDt.month,
      currentDt.day,
      currentDt.hour,
    );

    int startIndex = 0;
    for (int i = 0; i < times.length; i++) {
      if (!DateTime.parse(times[i] as String).isBefore(currentHour)) {
        startIndex = i;
        break;
      }
    }

    // The API returns parallel arrays — times[], temps[], codes[] at the same index
    // represent the same hour, so we zip them by index into model objects.
    final result = <HourlyWeather>[];
    for (int i = startIndex; i < startIndex + 24 && i < times.length; i++) {
      result.add(
        HourlyWeatherModel.fromValues(
          times[i] as String,
          (temps[i] as num).toDouble(),
          codes[i] as int,
        ),
      );
    }
    return result;
  }

  // Same parallel-array pattern as hourly — zip dates[], maxTemps[], minTemps[], codes[]
  // by index to build one DailyWeather per day.
  List<DailyWeather> _parseDailyWeather(Map<String, dynamic> json) {
    final daily = json['daily'] as Map<String, dynamic>;
    final dates = daily['time'] as List;
    final maxTemps = daily['temperature_2m_max'] as List;
    final minTemps = daily['temperature_2m_min'] as List;
    final codes = daily['weather_code'] as List;

    return List.generate(dates.length, (i) {
      return DailyWeatherModel.fromValues(
        dates[i] as String,
        (maxTemps[i] as num).toDouble(),
        (minTemps[i] as num).toDouble(),
        codes[i] as int,
      );
    });
  }
}
