import 'package:bkash_dummy_app/core/app_colors.dart';
import 'package:bkash_dummy_app/core/app_strings.dart';
import 'package:bkash_dummy_app/presentation/screens/home/provider/home_provider.dart';
import 'package:bkash_dummy_app/presentation/screens/home/widget/menu_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        final items = provider.visibleItems;
        final isExpanded = provider.isExpanded;
        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              padding: .zero,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                childAspectRatio: 0.78,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return MenuGridItem(item: items[index]);
              },
            ),
            OutlinedButton.icon(
              onPressed: provider.toggleExpanded,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                ),
              ),
              label: Text(
                isExpanded ? AppStrings.seeLess : AppStrings.seeMore,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: .w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
