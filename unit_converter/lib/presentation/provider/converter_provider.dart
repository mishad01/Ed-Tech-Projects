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

  List<String> get fromUnits => _categories[_selectedCategoryIndex].units;
  List<String> get toUnits => _categories[_selectedCategoryIndex].units;
  List<String> get _currentUnits => _categories[_selectedCategoryIndex].units;
  List<String> get currentUnits => _currentUnits;

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    _fromUnit = _currentUnits[0];
    _toUnit = _currentUnits[1];
    notifyListeners();
  }

  ConverterProvider() {
    _fromUnit = _currentUnits[0];
    _toUnit = _currentUnits[1];
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

  void swapUnits() {
    final temp = _fromUnit;
    _fromUnit = _toUnit;
    _toUnit = temp;
    notifyListeners();
  }

  String _formate(double value) {
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    } else {
      return value.toStringAsFixed(2);
    }
  }

  String get result {
    final double? inputValue = double.tryParse(_inputText);
    if (inputValue == null) {
      return AppStrings.resultHint;
    }

    final double convertedValue = UnitCategoryModel.convert(
      value: inputValue,
      fromUnit: _fromUnit,
      toUnit: _toUnit,
      categoryName: _categories[_selectedCategoryIndex].name,
    );

    return _formate(convertedValue);
  }
}
