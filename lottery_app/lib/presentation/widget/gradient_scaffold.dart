// Widget - Gradient Scaffold
// Reusable scaffold with a gradient background and transparent AppBar

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBackButton;
  final List<Color>? gradientColors;

  const GradientScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = true,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.white),
        automaticallyImplyLeading: showBackButton,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors ?? AppColors.primaryGradient,
          ),
        ),
        child: body,
      ),
    );
  }
}
