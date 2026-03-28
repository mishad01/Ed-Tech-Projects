import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';
import 'package:unit_converter/presentation/widget/category_selector.dart';
import 'package:unit_converter/presentation/widget/input_field.dart';
import 'package:unit_converter/presentation/widget/result_card.dart';
import 'package:unit_converter/presentation/widget/unit_drop_down.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: .start,
          children: [
            Text(
              AppStrings.chooseCategory,
              style: TextStyle(fontSize: 14, fontWeight: .w600),
            ),
            Center(child: CategorySelector()),
            Text(
              AppStrings.enterValue,
              style: TextStyle(fontSize: 14, fontWeight: .w600),
            ),
            InputField(),
            Text(
              AppStrings.selectUnits,
              style: TextStyle(fontSize: 14, fontWeight: .w600),
            ),
            Row(
              children: [
                Expanded(
                  child: UnitDropdown(
                    label: AppStrings.fromLabel,
                    selectedUnit: provider.fromUnit,
                    units: provider.currentUnits,
                    onChanged: (value) {
                      context.read<ConverterProvider>().updateFromUnit(value!);
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
                    selectedUnit: provider.toUnit,
                    units: provider.currentUnits,
                    onChanged: (value) {
                      context.read<ConverterProvider>().updateToUnit(value!);
                    },
                  ),
                ),
              ],
            ),
            ResultCard(),
          ],
        ),
      ),
    );
  }
}
