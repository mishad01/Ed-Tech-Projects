// Domain entity for a single hourly forecast slot.
// Holds only what the UI needs — time, temp, and weather code for the icon.
class HourlyWeather {
  final String time;        // ISO 8601 datetime string e.g. "2024-01-01T14:00"
  final double temperature; // Temperature in °C for that hour
  final int weatherCode;    // WMO code — used to pick the right icon via WeatherHelper

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });
}
