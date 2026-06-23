import 'package:flutter/material.dart';
import 'package:unit_converter/presentation/screen/widget/unit_dropdown.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unit Converter')),
      body: Column(
        children: [
          const Center(child: Text('Converter Screen')),
          UnitDropdown(
            label: 'From Unit',
            selectedUnit: 'Meter',
            units: ['Meter', 'Kilometer', 'Mile'],
            onChanged: (value) {},
          ),
          UnitDropdown(
            label: 'To Unit',
            selectedUnit: 'Kilometer',
            units: ['Meter', 'Kilometer', 'Mile'],
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
