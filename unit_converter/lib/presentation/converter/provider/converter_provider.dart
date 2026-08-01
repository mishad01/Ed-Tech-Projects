import 'package:flutter/material.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/data/model/unit_category_model.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

class ConverterProvider extends ChangeNotifier {
  final List<UnitCategory> _categories = UnitCategoryModel.allCategories;
  int _selectedCategoryIndex = 0;
  String _fromUnit = '';
  String _toUnit = '';
  String _inputText = '';

  List<UnitCategory> get categories => _categories;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;
  String get inputText => _inputText;

  List<String> get _currentUnits => _categories[_selectedCategoryIndex].units;
  List<String> get currentUnits => _currentUnits;

  ConverterProvider() {
    _fromUnit = _currentUnits.first;
    _toUnit = _currentUnits.last;
  }

  String get result {
    final double inputValue = double.tryParse(_inputText) ?? 0.0;
    if (inputValue == 0.0) return AppStrings.resultHint;
    final double convertedValue = UnitCategoryModel.convert(
      inputValue,
      _fromUnit,
      _toUnit,
      _categories[_selectedCategoryIndex].name,
    );
    return _format(convertedValue);
  }

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    _fromUnit = _currentUnits.first;
    _toUnit = _currentUnits.last;
    notifyListeners();
  }

  void updateInput(String value) {
    _inputText = value;
    notifyListeners();
  }

  void updateFromUnit(String unit) {
    _fromUnit = unit;
    notifyListeners();
  }

  void updateToUnit(String unit) {
    _toUnit = unit;
    notifyListeners();
  }

  void swap() {
    final String temp = _fromUnit;
    _fromUnit = _toUnit;
    _toUnit = temp;
    notifyListeners();
  }

  /// Formats a number by removing unnecessary trailing zeros.
  ///
  /// Examples:
  /// 12.000 -> "12"
  /// 5.500  -> "5.5"
  /// 3.142  -> "3.142"
  String _format(double value) {
    // Convert the value to a string with 3 decimal places.
    String str = value.toStringAsFixed(3);

    // Remove trailing zeros after the decimal point.
    str = str.replaceAll(RegExp(r'0+$'), '');

    // Remove the decimal point if no digits remain after it.
    str = str.replaceAll(RegExp(r'\.$'), '');

    return str;
  }
}
