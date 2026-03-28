// Widget - Result Icon
// Displays the win/lose emoji icon with a frosted circle backdrop

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class ResultIcon extends StatelessWidget {
  final bool isWinner;

  const ResultIcon({super.key, required this.isWinner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteOpacity20,
      ),
      child: Text(isWinner ? '🎉' : '😢', style: const TextStyle(fontSize: 64)),
    );
  }
}
