import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/data/model/home_menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuGridItem extends StatelessWidget {
  const MenuGridItem({super.key, required this.item});
  final HomeMenuItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.iconCircleBg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(item.iconData, color: item.iconColor),
        ),
        Text(
          item.label,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
