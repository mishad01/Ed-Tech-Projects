import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/core/app_strings.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Icon(Icons.person, color: Colors.white),
          radius: 22,
        ),
        SizedBox(width: 10),

        Column(
          children: [
            Text(
              AppStrings.userName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: .w600,
              ),
            ),
            _BalanceCheck(),
          ],
        ),
      ],
    );
  }
}

class _BalanceCheck extends StatelessWidget {
  const _BalanceCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
      ),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '৳',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: .bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          Text(AppStrings.tapForBalance, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
