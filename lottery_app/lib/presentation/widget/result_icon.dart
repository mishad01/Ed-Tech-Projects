import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class ResultIcon extends StatelessWidget {
  const ResultIcon({super.key, required this.isWinner});
  final bool isWinner;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteOpacity20,
      ),
      child: Text(isWinner ? '🎉' : '😭', style: TextStyle(fontSize: 60)),
    );
  }
}
