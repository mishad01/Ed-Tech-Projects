import 'package:flutter/foundation.dart';
import '../../core/app_strings.dart';
import '../../data/service/weather_service.dart';
import '../../domain/entities/weather_result.dart';

class WeatherProvider extends ChangeNotifier {
  final _service = WeatherService();

  WeatherResult? _weatherResult;
  WeatherResult? get weatherResult => _weatherResult;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  String _cityName = '';
  String get cityName => _cityName;

  String _currentCity = AppStrings.defaultCity;
  String get currentCity => _currentCity;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      final cityInfo = await _service.getCityLocation(city);
      if (cityInfo == null) {
        _errorMessage = 'City "$city" not found.';
        return;
      }
      final result = await _service.getWeather(
        cityInfo['latitude'] as double,
        cityInfo['longitude'] as double,
      );
      _cityName = '${cityInfo['name']}, ${cityInfo['country']}';
      _currentCity = city;
      _weatherResult = result;
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load weather. Check your connection.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() => fetchWeather(_currentCity);
}
