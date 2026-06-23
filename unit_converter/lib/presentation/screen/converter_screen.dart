import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';
import 'package:unit_converter/presentation/screen/widget/category_selector.dart';
import 'package:unit_converter/presentation/screen/widget/input_field.dart';
import 'package:unit_converter/presentation/screen/widget/result_card.dart';
import 'package:unit_converter/presentation/screen/widget/unit_dropdown.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ConverterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Unit Converter')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 16,
            children: [
              const Center(child: Text('Converter Screen')),
              CategorySelector(),
              InputField(),
              Row(
                children: [
                  Expanded(
                    child: UnitDropdown(
                      label: AppStrings.fromLabel,
                      selectedUnit: provider.fromUnit,
                      units: provider.currentUnits,
                      onChanged: (value) {
                        context.read<ConverterProvider>().updateFromUnit(
                          value!,
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.read<ConverterProvider>().swap(),
                    icon: const Icon(Icons.swap_horiz),
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
      ),
    );
  }
}
