import 'package:flutter/material.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

class UnitCategoryModel extends UnitCategory {
  const UnitCategoryModel({
    required super.name,
    required super.iconData,
    required super.units,
  });

  static const List<UnitCategoryModel> allCategoris = [
    UnitCategoryModel(
      name: 'Length',
      iconData: Icons.straighten,
      units: ['Meter', 'Kilometer', 'Mile', 'Foot', 'Inch', 'Centimeter'],
    ),

    UnitCategoryModel(
      name: 'Weight',
      iconData: Icons.fitness_center,
      units: ['Kilogram', 'Gram', 'Pound', 'Ounce'],
    ),
    UnitCategoryModel(
      name: 'Temperature',
      iconData: Icons.thermostat,
      units: ['Celsius', 'Fahrenheit', 'Kelvin'],
    ),
  ];
}
