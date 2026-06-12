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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _NumbericField(
              controller: heightController,
              label: 'Height',
              hint: 'e.g. 170',
              suffix: 'cm',
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
            SizedBox(height: 16),
            _NumbericField(
              controller: weightController,
              label: 'Weight',
              hint: 'e.g. 60',
              suffix: 'kg',
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

class _NumbericField extends StatelessWidget {
  const _NumbericField({
    super.key,
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
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixText: suffix,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
