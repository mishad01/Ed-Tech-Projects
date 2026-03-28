// Widget - Error Banner
// Displays an error message with a red-tinted glass card styling

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class ErrorBanner extends StatelessWidget {
  final String message;

  const ErrorBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.redOpacity20,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.errorRed, width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
