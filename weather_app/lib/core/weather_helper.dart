import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'app_colors.dart';

class WeatherHelper {
  WeatherHelper._(); // Private constructor to prevent instantiation
  static String getConditionText(int code) {
    if (code == 0) return 'Sunny';
    if (code == 1) return 'Mainly Clear';
    if (code == 2) return 'Partly Cloudy';
    if (code == 3) return 'Overcast';
    if (code == 45 || code == 48) return 'Foggy';
    if (code >= 51 && code <= 55) return 'Drizzle';
    if (code >= 61 && code <= 65) return 'Rainy';
    if (code >= 71 && code <= 77) return 'Snowy';
    if (code >= 80 && code <= 82) return 'Rain Showers';
    if (code == 85 || code == 86) return 'Snow Showers';
    if (code >= 95) return 'Thunderstorm';
    return 'Clear';
  }

  static IconData getWeatherIcon(int code) {
    if (code == 0) return CupertinoIcons.sun_max_fill;
    if (code == 1 || code == 2) return CupertinoIcons.cloud_sun_fill;
    if (code == 3) return CupertinoIcons.cloud_fill;
    if (code == 45 || code == 48) return CupertinoIcons.cloud_fog_fill;
    if (code >= 51 && code <= 55) return CupertinoIcons.cloud_drizzle_fill;
    if (code >= 61 && code <= 65) return CupertinoIcons.cloud_rain_fill;
    if (code >= 71 && code <= 77) return CupertinoIcons.snow;
    if (code >= 80 && code <= 82) return CupertinoIcons.cloud_rain_fill;
    if (code == 85 || code == 86) return CupertinoIcons.cloud_snow_fill;
    if (code >= 95) return CupertinoIcons.cloud_bolt_fill;
    return CupertinoIcons.sun_max_fill;
  }

  static List<Color> getGradientColors(int code) {
    if (code == 0 || code == 1) return AppColors.sunnyGradient;
    if (code == 2 || code == 3 || code == 45 || code == 48) {
      return AppColors.cloudyGradient;
    }
    if ((code >= 51 && code <= 67) || (code >= 80 && code <= 82)) {
      return AppColors.rainyGradient;
    }
    if ((code >= 71 && code <= 77) || code == 85 || code == 86) {
      return AppColors.snowyGradient;
    }
    if (code >= 95) return AppColors.stormyGradient;
    return AppColors.sunnyGradient;
  }

  static String formatHour(String isoTime, {bool isNow = false}) {
    if (isNow) return 'Now';
    final dt = DateTime.parse(isoTime);
    return DateFormat('h a').format(dt);
  }

  static String formatDay(String dateStr, {bool isToday = false}) {
    if (isToday) return 'Today';
    final date = DateTime.parse(dateStr);
    return DateFormat('EEE').format(date);
  }
}
