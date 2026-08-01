import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/converter/provider/converter_provider.dart';
import 'package:unit_converter/presentation/converter/widget/category_selector.dart';
import 'package:unit_converter/presentation/converter/widget/input_field.dart';
import 'package:unit_converter/presentation/converter/widget/unit_dropdown.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Unit Converter ')),
      body: Padding(
        padding: .all(20),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.chooseCategory),
            CategorySelector(),
            Text(AppStrings.inputLabel),
            InputField(),
            Text(AppStrings.selectUnits),
            Row(
              children: [
                Expanded(
                  child: UnitDropdown(
                    label: AppStrings.fromLabel,
                    selectedValue: provider.fromUnit,
                    units: provider.currentUnits,
                    onChanged: (value) {
                      if (value != null) {
                        provider.updateFromUnit(value);
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: () => context.read<ConverterProvider>().swap(),
                  icon: Icon(Icons.swap_horiz),
                ),
                Expanded(
                  child: UnitDropdown(
                    label: AppStrings.toLabel,
                    selectedValue: provider.toUnit,
                    units: provider.currentUnits,
                    onChanged: (value) {
                      if (value != null) {
                        provider.updateToUnit(value);
                      }
                    },
                  ),
                ),
              ],
            ),
            Consumer<ConverterProvider>(
              builder: (context, provider, child) {
                return Center(
                  child: Container(
                    width: double.infinity,
                    padding: .all(22),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      borderRadius: .circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(AppStrings.resultLabel),
                        Text(
                          provider.result,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
