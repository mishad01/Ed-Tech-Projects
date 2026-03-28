// Core - App Colors
// Centralized color definitions for the entire app

import 'package:flutter/material.dart';

class AppColors {
  // Primary gradient colors
  static final Color primaryPurple = const Color(0xFF6A11CB);
  static final Color primaryBlue = const Color(0xFF2575FC);
  static final Color primaryPurpleDark = Colors.purple.shade900;

  // Accent colors (cyan/teal theme)
  static final Color accentCyan = Colors.cyan.shade400;
  static final Color accentTeal = Colors.teal.shade600;
  static final Color accentCyanLight = Colors.cyan.shade300;
  static final Color accentCyanDark = Colors.teal.shade700;

  // Win state colors
  static final Color winCyan = const Color(0xFF00E5FF);
  static final Color winTeal = const Color(0xFF00BCD4);
  static final Color winTealDark = Colors.teal.shade700;

  // UI element colors
  static final Color buttonForeground = Colors.purple.shade900;
  static final Color iconYellow = Colors.yellow.shade300;
  static final Color errorRed = Colors.red.shade300;
  static final Color disabledGrey = Colors.grey.shade600;
  static final Color disabledGreyLight = Colors.grey.shade400;

  // Secondary colors
  static final Color blueAccent = Colors.blue.shade400;
  static final Color purpleAccent = Colors.purple.shade400;

  // White with opacity
  static const Color white = Colors.white;
  static final Color whiteOpacity90 = Colors.white.withOpacity(0.9);
  static final Color whiteOpacity80 = Colors.white.withOpacity(0.8);
  static final Color whiteOpacity70 = Colors.white.withOpacity(0.7);
  static final Color whiteOpacity50 = Colors.white.withOpacity(0.5);
  static final Color whiteOpacity30 = Colors.white.withOpacity(0.3);
  static final Color whiteOpacity20 = Colors.white.withOpacity(0.2);
  static final Color whiteOpacity15 = Colors.white.withOpacity(0.15);
  static final Color whiteOpacity10 = Colors.white.withOpacity(0.1);

  // Black with opacity
  static final Color blackOpacity10 = Colors.black.withOpacity(0.1);
  static final Color blackOpacity30 = Colors.black.withOpacity(0.3);

  // Red with opacity (for errors)
  static final Color redOpacity20 = Colors.red.withOpacity(0.2);

  // Gradient definitions
  static List<Color> get primaryGradient => [
    primaryPurple,
    primaryBlue,
    primaryPurpleDark,
  ];
  static List<Color> get accentGradient => [accentCyan, accentTeal];
  static List<Color> get winGradient => [winCyan, winTeal, winTealDark];
  static List<Color> get glassGradient => [whiteOpacity20, whiteOpacity10];
  static List<Color> get tileGradient => [whiteOpacity15, whiteOpacity10];

  // Shadow colors
  static Color get cyanShadow => accentCyan.withOpacity(0.5);
  static Color get cyanShadowStrong => accentCyan.withOpacity(0.6);
  static Color get blueShadow => Colors.blue.withOpacity(0.4);
}
