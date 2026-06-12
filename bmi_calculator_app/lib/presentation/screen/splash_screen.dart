import 'package:bmi_calculator_app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: .circle,
              ),
              child: Icon(
                Icons.monitor_weight_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Bmi Calculator",
              style: TextStyle(
                color: Colors.white,
                fontWeight: .bold,
                fontSize: 32,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Know your body, know yourself",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 14,
                letterSpacing: .5,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
