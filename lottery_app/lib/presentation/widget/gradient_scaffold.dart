import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = false,
    this.gradientColors,
  });
  final String title;
  final Widget body;
  final bool showBackButton;
  final List<Color>? gradientColors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontWeight: .bold, color: AppColors.white),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        automaticallyImplyLeading: showBackButton,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ?? AppColors.primaryGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: body,
      ),
    );
  }
}
