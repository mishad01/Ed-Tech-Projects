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

class WeatherService {
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

  static Map<String, dynamic> _decodeJson(String body) =>
      jsonDecode(body) as Map<String, dynamic>;

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

class getNotificationfromFirebase {
  Future<void> getNotification() async {
    // Implement your logic to fetch notifications from Firebase here
  }
}
