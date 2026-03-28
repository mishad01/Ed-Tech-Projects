// Screen - Home Screen
// Landing screen of the Mini Lottery app

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/presentation/widget/gradient_scaffold.dart';
import 'entry_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: AppStrings.homeTitle,
      showBackButton: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottery icon with glow effect
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: AppColors.accentGradient),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cyanShadowStrong,
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.casino,
                    size: 80,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 50),
                // Glassmorphism card
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.glassGradient,
                    ),
                    border: Border.all(
                      color: AppColors.whiteOpacity30,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackOpacity10,
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        AppStrings.homeTitle,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        AppStrings.homeTagline,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        AppStrings.homeEmoji,
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                // Play Lottery button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EntryScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentCyan,
                    foregroundColor: AppColors.buttonForeground,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: AppColors.cyanShadow,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow, size: 28),
                      SizedBox(width: 12),
                      Text(
                        AppStrings.playLotteryButton,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
