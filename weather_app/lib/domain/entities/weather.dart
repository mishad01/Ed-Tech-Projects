// Domain entity for current weather conditions.
// Pure Dart only — no Flutter, no JSON, no external packages.
// If the API changes, only the model (WeatherModel) changes, not this class.
class Weather {
  final double temperature; // Current temperature in °C
  final double windSpeed;   // Wind speed in km/h
  final int weatherCode;    // WMO weather code — mapped to icon/label in WeatherHelper
  final String time;        // Observation time from API (ISO 8601)
  final double highTemp;    // Today's high — pulled from daily[0] in the API response
  final double lowTemp;     // Today's low — pulled from daily[0] in the API response

  Weather({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.time,
    required this.highTemp,
    required this.lowTemp,
  });
}
