// Widget - Number Tile
// A tappable number tile used in the number picker grid on the Entry Screen

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class NumberTile extends StatelessWidget {
  final int number;
  final bool isSelected;
  final VoidCallback onTap;

  const NumberTile({
    super.key,
    required this.number,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: isSelected
              ? LinearGradient(colors: AppColors.accentGradient)
              : LinearGradient(colors: AppColors.tileGradient),
          border: Border.all(
            color: isSelected
                ? AppColors.accentCyanLight
                : AppColors.whiteOpacity30,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.cyanShadow,
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.white : AppColors.whiteOpacity90,
            ),
          ),
        ),
      ),
    );
  }
}
