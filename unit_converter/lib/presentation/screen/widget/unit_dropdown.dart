import 'package:flutter/material.dart';

class UnitDropdown extends StatelessWidget {
  const UnitDropdown({
    super.key,
    required this.label,
    required this.selectedUnit,
    required this.units,
    required this.onChanged,
  });
  final String label;
  final String selectedUnit;
  final List<String> units;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedUnit,
      isExpanded: true,
      decoration: InputDecoration(labelText: label),
      items: units.map((unit) {
        return DropdownMenuItem<String>(value: unit, child: Text(unit));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
