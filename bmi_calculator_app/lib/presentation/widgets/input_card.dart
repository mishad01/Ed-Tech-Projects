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
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _NumericField(
              controller: heightController,
              label: 'Height (cm)',
              hint: 'e.g 170',
              suffix: 'cm',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your height';
                }
                final double? height = double.tryParse(value);
                if (height == null || height <= 0) {
                  return 'Please enter a valid height';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _NumericField(
              controller: weightController,
              label: 'Weight (kg)',
              hint: 'e.g 70',
              suffix: 'kg',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your weight';
                }
                final double? weight = double.tryParse(value);
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

class _NumericField extends StatelessWidget {
  const _NumericField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.suffix,
    required this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final String suffix;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixText: suffix,
        hintText: hint,
      ),
    );
  }
}
