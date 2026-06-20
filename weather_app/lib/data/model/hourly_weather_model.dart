import '../../domain/entities/hourly_weather.dart';

class HourlyWeatherModel extends HourlyWeather {
  HourlyWeatherModel({
    required super.time,
    required super.temperature,
    required super.weatherCode,
  });

  factory HourlyWeatherModel.fromValues(
    String time,
    double temperature,
    int weatherCode,
  ) {
    return HourlyWeatherModel(
      time: time,
      temperature: temperature,
      weatherCode: weatherCode,
    );
  }
}
