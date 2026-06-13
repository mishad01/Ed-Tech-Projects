import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import '../../core/app_colors.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.bmi,
    required this.category,
    required this.categoryColor,
  });
  final double bmi;
  final String category;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your BMI is',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: categoryColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                category,
                style: TextStyle(fontSize: 20, color: categoryColor),
              ),
            ),
            SizedBox(height: 12),
            _BmiGauge(bmi: bmi),
          ],
        ),
      ),
    );
  }
}

class _BmiGauge extends StatelessWidget {
  const _BmiGauge({super.key, required this.bmi});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return AnimatedRadialGauge(
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      radius: 100,
      value: bmi.clamp(10, 40),
      axis: const GaugeAxis(
        min: 10,
        max: 40,
        sweepDegrees: 180,
        style: GaugeAxisStyle(
          thickness: 12,
          background: Colors.white,
          zoneSpacing: 3,
          blendColors: false,
        ),
        pointer: GaugePointer.needle(
          width: 12,
          height: 60,
          borderRadius: 8,
          color: Colors.black87,
        ),
        progressBar: GaugeProgressBar.rounded(color: Colors.transparent),
        zones: [
          GaugeZone(from: 10, to: 18.5, color: AppColors.underweight),
          GaugeZone(from: 18.5, to: 25, color: AppColors.normal),
          GaugeZone(from: 25, to: 30, color: AppColors.overweight),
          GaugeZone(from: 30, to: 40, color: AppColors.obese),
        ],
      ),
    );
  }
}
