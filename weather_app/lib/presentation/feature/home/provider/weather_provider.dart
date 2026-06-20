import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/app_strings.dart';
import 'package:weather_app/data/service/weather_service.dart';
import 'package:weather_app/domain/entities/weather_result.dart';

class WeatherProvider extends ChangeNotifier {
  final _service = WeatherService();

  WeatherResult? _weatherResult;
  WeatherResult? get weatherResult => _weatherResult;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage = '';
  String? get errorMessage => _errorMessage;

  String? _cityName = '';
  String? get cityName => _cityName;

  String _currentCity = AppStrings.defaultCity;
  String get currentCity => _currentCity;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final cityInfo = await _service.getCityLocation(city);
      if (cityInfo == null) {
        _errorMessage = 'City not found';
        _isLoading = false;
        notifyListeners();
        return;
      }
      final result = await _service.getWeather(
        cityInfo['latitude'] as double,
        cityInfo['longitude'] as double,
      );

      _cityName = '${cityInfo['name']}, ${cityInfo['country']}';
      _weatherResult = result;
      _currentCity = city;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error fetching weather data';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    if (_currentCity.isNotEmpty) {
      await fetchWeather(_currentCity);
    }
  }
}
