//A single hourly forecast slot
class HourlyWeather {
  final String time;
  final double temperature;
  final int weatherCode;

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });
}
