// Widget - Result Number Card
// Displays the user number vs winning number comparison card on the Result Screen

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/domain/entities/lottery_result.dart';

class ResultNumberCard extends StatelessWidget {
  final LotteryResult result;

  const ResultNumberCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.whiteOpacity15,
        border: Border.all(color: AppColors.whiteOpacity30),
      ),
      child: Column(
        children: [
          _buildNumberCircle(
            AppStrings.yourNumber,
            result.userNumber,
            AppColors.blueAccent,
            Icons.person,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Divider(color: AppColors.whiteOpacity50, thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  AppStrings.vsLabel,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteOpacity80,
                  ),
                ),
              ),
              Expanded(
                child: Divider(color: AppColors.whiteOpacity50, thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildNumberCircle(
            AppStrings.winningNumber,
            result.winningNumber,
            result.isWinner ? AppColors.accentCyan : AppColors.purpleAccent,
            Icons.stars,
          ),
        ],
      ),
    );
  }

  Widget _buildNumberCircle(
    String label,
    int number,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [color, color.withOpacity(0.7)]),
          ),
          child: Center(
            child: Text(
              '$number',
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
