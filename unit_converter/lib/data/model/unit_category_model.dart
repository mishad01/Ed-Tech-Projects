import 'package:unit_converter/domain/entities/unit_category.dart';
import 'package:flutter/material.dart';

class UnitCategoryModel extends UnitCategory {
  const UnitCategoryModel({
    required super.name,
    required super.iconData,
    required super.units,
  });

  static const List<UnitCategoryModel> allCategories = [
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

  static double convert({
    required double value,
    required String fromUnit,
    required String toUnit,
    required String categoryName,
  }) {
    if (fromUnit == toUnit) return value;

    switch (categoryName) {
      case 'Length':
        return _convertLength(value, fromUnit, toUnit);
      case 'Weight':
        return _convertWeight(value, fromUnit, toUnit);
      case 'Temperature':
        return _convertTemperature(value, fromUnit, toUnit);
      default:
        return value;
    }
  }

  static double _convertLength(double value, String from, String to) {
    final double inMeters = _toMeters(value, from);
    return _fromMeters(inMeters, to);
  }

  static double _toMeters(double value, String unit) {
    switch (unit) {
      case 'Meter':
        return value;
      case 'Kilometer':
        return value * 1000;
      case 'Mile':
        return value * 1609.344;
      case 'Foot':
        return value * 0.3048;
      case 'Inch':
        return value * 0.0254;
      case 'Centimeter':
        return value * 0.01;
      default:
        return value;
    }
  }

  static double _fromMeters(double meters, String unit) {
    switch (unit) {
      case 'Meter':
        return meters;
      case 'Kilometer':
        return meters / 1000;
      case 'Mile':
        return meters / 1609.344;
      case 'Foot':
        return meters / 0.3048;
      case 'Inch':
        return meters / 0.0254;
      case 'Centimeter':
        return meters / 0.01;
      default:
        return meters;
    }
  }

  static double _convertTemperature(double value, String from, String to) {
    double celsius;
    switch (from) {
      case 'Celsius':
        celsius = value;
        break;
      case 'Fahrenheit':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'Kelvin':
        celsius = value - 273.15;
        break;
      default:
        celsius = value;
    }

    switch (to) {
      case 'Celsius':
        return celsius;
      case 'Fahrenheit':
        return celsius * 9 / 5 + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        return celsius;
    }
  }

  static double _convertWeight(double value, String from, String to) {
    final double inKg = _toKilograms(value, from);
    return _fromKilograms(inKg, to);
  }

  static double _toKilograms(double value, String unit) {
    switch (unit) {
      case 'Kilogram':
        return value;
      case 'Gram':
        return value / 1000;
      case 'Pound':
        return value * 0.453592;
      case 'Ounce':
        return value * 0.0283495;
      default:
        return value;
    }
  }

  static double _fromKilograms(double kg, String unit) {
    switch (unit) {
      case 'Kilogram':
        return kg;
      case 'Gram':
        return kg * 1000;
      case 'Pound':
        return kg / 0.453592;
      case 'Ounce':
        return kg / 0.0283495;
      default:
        return kg;
    }
  }
}
