// Domain entity for a single day in the forecast.
// min/max temps are both stored so the UI can draw the temperature range bar.
class DailyWeather {
  final String date;     // Date string e.g. "2024-01-01" — formatted to "Mon", "Today" in WeatherHelper
  final double maxTemp;  // Day's high temperature in °C
  final double minTemp;  // Day's low temperature in °C
  final int weatherCode; // WMO code for the dominant weather condition of the day

  DailyWeather({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCode,
  });
}
