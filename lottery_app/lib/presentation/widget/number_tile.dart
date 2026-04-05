import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class NumberTile extends StatelessWidget {
  const NumberTile({
    super.key,
    required this.number,
    required this.isSelected,
    required this.onTap,
  });
  final int number;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(15),
        gradient: isSelected
            ? LinearGradient(colors: AppColors.accentGradient)
            : LinearGradient(colors: AppColors.tileGradient),
        border: .all(
          color: isSelected
              ? AppColors.accentCyanLight
              : AppColors.whiteOpacity30,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackOpacity10,
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),

      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
