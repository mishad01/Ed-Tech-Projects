class AppStrings {
  AppStrings._(); // Private constructor to prevent instantiation
  static const String appName = 'Weather';
  static const String geocodingBaseUrl =
      'https://geocoding-api.open-meteo.com/v1/search';
  static const String weatherBaseUrl = 'https://api.open-meteo.com/v1/forecast';
  static const String defaultCity = 'London';
}
