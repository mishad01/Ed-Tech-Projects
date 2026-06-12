import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import '../../core/colors/app_colors.dart';

class ResultCard extends StatelessWidget {
  final double bmi;
  final String category;
  final Color categoryColor;

  const ResultCard({
    super.key,
    required this.bmi,
    required this.category,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Your BMI',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: categoryColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: categoryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            _BmiGauge(bmi: bmi),
          ],
        ),
      ),
    );
  }
}

class _BmiGauge extends StatelessWidget {
  final double bmi;

  const _BmiGauge({required this.bmi});

  @override
  Widget build(BuildContext context) {
    return AnimatedRadialGauge(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.elasticOut,
      radius: 100,
      value: bmi.clamp(10.0, 40.0),
      axis: GaugeAxis(
        min: 10,
        max: 40,
        sweepDegrees: 180,
        style: const GaugeAxisStyle(
          thickness: 16,
          background: Color(0xFFE0E0E0),
          zoneSpacing: 3,
          blendColors: false,
        ),
        pointer: GaugePointer.needle(
          width: 14,
          height: 60,
          borderRadius: 4,
          color: Colors.black87,
        ),
        progressBar: const GaugeProgressBar.rounded(color: Colors.transparent),
        zones: const [
          GaugeZone(
            from: 10,
            to: 18.5,
            color: AppColors.underweight,
            cornerRadius: Radius.zero,
          ),
          GaugeZone(
            from: 18.5,
            to: 25,
            color: AppColors.normal,
            cornerRadius: Radius.zero,
          ),
          GaugeZone(
            from: 25,
            to: 30,
            color: AppColors.overweight,
            cornerRadius: Radius.zero,
          ),
          GaugeZone(
            from: 30,
            to: 40,
            color: AppColors.obese,
            cornerRadius: Radius.zero,
          ),
        ],
      ),
    );
  }
}
