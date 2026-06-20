import 'daily_weather.dart';
import 'hourly_weather.dart';
import 'weather.dart';

// Bundles all three API responses into a single object so the service
// returns one clean result instead of making the provider handle three
// separate futures or passing raw maps around.
class WeatherResult {
  final Weather current;           // Current conditions
  final List<HourlyWeather> hourly; // Next 24 hours
  final List<DailyWeather> daily;   // 10-day forecast

  WeatherResult({
    required this.current,
    required this.hourly,
    required this.daily,
  });
}
