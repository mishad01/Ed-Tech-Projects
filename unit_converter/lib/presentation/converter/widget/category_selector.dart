import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/presentation/converter/provider/converter_provider.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    return Row(
      spacing: 10,
      crossAxisAlignment: .center,
      mainAxisAlignment: .spaceEvenly,
      children: List.generate(provider.categories.length, (index) {
        final category = provider.categories[index];
        final isSelected = provider.selectedCategoryIndex == index;
        return GestureDetector(
          onTap: () => context.read<ConverterProvider>().selectCategory(index),
          child: Container(
            padding: .all(20),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).primaryColor.withAlpha(80)
                  : Theme.of(context).colorScheme.surfaceContainerHigh,
              borderRadius: .circular(16),
            ),
            child: Column(
              children: [Icon(category.iconData), Text(category.name)],
            ),
          ),
        );
      }),
    );
  }
}
