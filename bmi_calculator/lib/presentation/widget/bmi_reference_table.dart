import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';

class BmiReferenceTable extends StatelessWidget {
  const BmiReferenceTable({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = [
      ('< 18.5', 'Underweight', AppColors.underweight),
      ('18.5 – 24.9', 'Normal weight', AppColors.normal),
      ('25 – 29.9', 'Overweight', AppColors.overweight),
      ('≥ 30', 'Obese', AppColors.obese),
    ];

    return Card(
      color: AppColors.scaffoldBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BMI Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...rows.map(
              (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: row.$3,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: Text(
                        row.$1,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(row.$2, style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
