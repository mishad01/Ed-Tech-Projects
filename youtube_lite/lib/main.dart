import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_lite/core/constants/app_colors.dart';
import 'package:youtube_lite/core/constants/app_strings.dart';
import 'package:youtube_lite/presentation/home/screen/home_screen.dart';

void main() {
  runApp(const YouTubeLiteApp());
}

class YouTubeLiteApp extends StatelessWidget {
  const YouTubeLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: AppColors.youtubePrimary,
          surface: AppColors.surfaceDark,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundDark,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        splashColor: AppColors.youtubePrimary.withValues(alpha: 0.12),
        highlightColor: AppColors.youtubePrimary.withValues(alpha: 0.06),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
