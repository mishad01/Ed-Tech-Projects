import 'package:bmi_calculator/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  const InputCard({
    super.key,
    required this.heightController,
    required this.weightController,
  });
  final TextEditingController heightController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
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
              'Enter your details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'e.g. 170',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your height';
                }
                final height = double.tryParse(value);
                if (height == null || height <= 0) {
                  return 'Please enter a valid height';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'e.g. 70',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your weight';
                }
                final weight = double.tryParse(value);
                if (weight == null || weight <= 0) {
                  return 'Please enter a valid weight';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
