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
        final items =
            provider.visibleItems; // Get the visible items from the provider
        final isExpanded =
            provider.isExpanded; // Get the expansion state from the provider
        return Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemCount: provider.visibleItems.length, // Number of menu items
              itemBuilder: (context, index) {
                return MenuGridItem(item: items[index]);
              },
            ),
            OutlinedButton(
              onPressed: () {
                provider.toggleExpanded(); // Toggle the expansion state
              },
              child: Text(isExpanded ? 'Show Less' : 'Show More'),
            ),
          ],
        );
      },
    );
  }
}
