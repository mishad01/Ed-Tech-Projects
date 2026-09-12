import 'package:bkash_dummy_app/data/model/home_menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuGridItem extends StatelessWidget {
  const MenuGridItem({super.key, required this.item});
  final HomeMenuItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: item.iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(item.iconData, color: Colors.white, size: 24),
            ),
            SizedBox(height: 8),
            Text(
              item.label,
              style: TextStyle(fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
