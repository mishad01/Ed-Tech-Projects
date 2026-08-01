import 'package:flutter/material.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

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
      units: [
        'Meter',
        'Kilometer',
        'Centimeter',
        'Millimeter',
        'Mile',
        'Inch',
        'Foot',
      ],
    ),
    UnitCategoryModel(
      name: 'Weight',
      iconData: Icons.fitness_center,
      units: ['Kilogram', 'Gram', 'Milligram', 'Pound', 'Ounce'],
    ),
    UnitCategoryModel(
      name: 'Temperature',
      iconData: Icons.thermostat,
      units: ['Celsius', 'Fahrenheit', 'Kelvin'],
    ),
  ];

  static double convert(
    double value,
    String fromUnit,
    String toUnit,
    String categoryName,
  ) {
    if (fromUnit == toUnit) {
      return value;
    }

    switch (categoryName) {
      case 'Length':
        return _convertLength(value, fromUnit, toUnit);
      case 'Weight':
        return _convertWeight(value, fromUnit, toUnit);
      case 'Temperature':
        return _convertTemperature(value, fromUnit, toUnit);
      default:
        throw ArgumentError('Invalid category name: $categoryName');
    }
  }

  static double _convertLength(double value, String fromUnit, String toUnit) {
    final double inMeter = _toMeter(value, fromUnit);
    return _fromMeter(inMeter, toUnit);
  }

  static double _toMeter(double value, String unit) {
    switch (unit) {
      case 'Meter':
        return value;
      case 'Kilometer':
        return value * 1000;
      case 'Centimeter':
        return value / 100;
      case 'Millimeter':
        return value / 1000;
      case 'Mile':
        return value * 1609.34;
      case 'Inch':
        return value / 39.3701;
      case 'Foot':
        return value / 3.28084;
      default:
        throw ArgumentError('Invalid length unit: $unit');
    }
    ;
  }

  static double _fromMeter(double meter, String unit) {
    switch (unit) {
      case 'Meter':
        return meter;
      case 'Kilometer':
        return meter / 1000;
      case 'Centimeter':
        return meter * 100;
      case 'Millimeter':
        return meter * 1000;
      case 'Mile':
        return meter / 1609.34;
      case 'Inch':
        return meter * 39.3701;
      case 'Foot':
        return meter * 3.28084;
      default:
        return meter;
    }
  }

  static double _convertWeight(double value, String fromUnit, String toUnit) {
    final double inKilogram = _toKilogram(value, fromUnit);
    return _fromKilogram(inKilogram, toUnit);
  }

  static double _toKilogram(double value, String unit) {
    switch (unit) {
      case 'Kilogram':
        return value;
      case 'Gram':
        return value / 1000;
      case 'Milligram':
        return value / 1000000;
      case 'Pound':
        return value * 0.453592;
      case 'Ounce':
        return value * 0.0283495;
      default:
        throw ArgumentError('Invalid weight unit: $unit');
    }
  }

  static double _fromKilogram(double kilogram, String unit) {
    switch (unit) {
      case 'Kilogram':
        return kilogram;
      case 'Gram':
        return kilogram * 1000;
      case 'Milligram':
        return kilogram * 1000000;
      case 'Pound':
        return kilogram / 0.453592;
      case 'Ounce':
        return kilogram / 0.0283495;
      default:
        throw ArgumentError('Invalid weight unit: $unit');
    }
  }

  static double _convertTemperature(
    double value,
    String fromUnit,
    String toUnit,
  ) {
    double inCelsius = _toCelsius(value, fromUnit);
    return _fromCelsius(inCelsius, toUnit);
  }

  static double _toCelsius(double value, String unit) {
    switch (unit) {
      case 'Celsius':
        return value;
      case 'Fahrenheit':
        return (value - 32) * 5 / 9;
      case 'Kelvin':
        return value - 273.15;
      default:
        throw ArgumentError('Invalid temperature unit: $unit');
    }
  }

  static double _fromCelsius(double celsius, String unit) {
    switch (unit) {
      case 'Celsius':
        return celsius;
      case 'Fahrenheit':
        return (celsius * 9 / 5) + 32;
      case 'Kelvin':
        return celsius + 273.15;
      default:
        throw ArgumentError('Invalid temperature unit: $unit');
    }
  }
}
