import '../../domain/entities/daily_weather.dart';

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel({
    required super.date,
    required super.maxTemp,
    required super.minTemp,
    required super.weatherCode,
  });

  factory DailyWeatherModel.fromValues(
    String date,
    double maxTemp,
    double minTemp,
    int weatherCode,
  ) {
    return DailyWeatherModel(
      date: date,
      maxTemp: maxTemp,
      minTemp: minTemp,
      weatherCode: weatherCode,
    );
  }
}
