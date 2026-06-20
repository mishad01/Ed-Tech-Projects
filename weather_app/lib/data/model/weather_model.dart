import 'package:weather_app/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.temperature,
    required super.windSpeed,
    required super.weatherCode,
    required super.time,
    required super.highTemp,
    required super.lowTemp,
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> current,
    Map<String, dynamic> daily,
  ) {
    return WeatherModel(
      temperature: (current['temperature_2m'] as num).toDouble(),
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
      weatherCode: current['weather_code'] as int,
      time: current['time'] as String,
      highTemp: (daily['temperature_2m_max'][0] as num).toDouble(),
      lowTemp: (daily['temperature_2m_min'][0] as num).toDouble(),
    );
  }
}
