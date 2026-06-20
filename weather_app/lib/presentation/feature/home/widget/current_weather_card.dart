import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/weather_helper.dart';
import 'package:weather_app/domain/entities/weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({
    super.key,
    required this.cityName,
    required this.weather,
  });
  final String cityName;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 8,
        children: [
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat('EEEE, MMM d').format(DateTime.now()),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          Icon(
            WeatherHelper.getWeatherIcon(weather.weatherCode),
            size: 80,
            color: Colors.white,
          ),

          Text(
            '${weather.temperature.round()}°',
            style: const TextStyle(
              fontSize: 95,
              fontWeight: FontWeight.w100,
              height: 1,
              color: Colors.white,
            ),
          ),
          Text(
            WeatherHelper.getConditionText(weather.weatherCode),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              height: 1,
              color: Colors.white,
            ),
          ),
          Text(
            'H:${weather.highTemp.round()}° L:${weather.lowTemp.round()}°',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              height: 1,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wind_power,
                color: Colors.white.withValues(alpha: 0.8),
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                '${weather.windSpeed.round()} km/h',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          // Text(
          //   weath,
          //   style: const TextStyle(
          //     fontSize: 48,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
