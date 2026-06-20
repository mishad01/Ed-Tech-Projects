import 'package:weather_app/domain/entities/daily_weather.dart';
import 'package:weather_app/domain/entities/hourly_weather.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherResult {
  final Weather current;
  final List<HourlyWeather> hourly;
  final List<DailyWeather> daily;

  WeatherResult({
    required this.current,
    required this.hourly,
    required this.daily,
  });
}
