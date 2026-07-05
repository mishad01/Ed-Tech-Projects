import 'package:bkash_dummy_app/core/app_colors.dart';
import 'package:bkash_dummy_app/presentation/home/provider/home_provider.dart';
import 'package:bkash_dummy_app/presentation/home/widget/menu_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        final item = provider.visibleItems;
        final isExpanded = provider.isExpanded;

        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              padding: .zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                childAspectRatio: 0.78,
                crossAxisSpacing: 16,
              ),
              itemCount: item.length,
              itemBuilder: (context, index) {
                return MenuGridItem(item: item[index]);
              },
            ),
            OutlinedButton(
              onPressed: () {
                provider.toggleExpanded();
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: AppColors.primary),
                ),
              ),
              child: Text(
                isExpanded ? 'See Less' : 'See More',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              '/Users/sakif/Documents/work/Ed-Tech-Projects/bkash_dummy_app/assets/offfer_banner.png',
            ),
          ],
        );
      },
    );
  }
}
