// Presentation - Lottery Provider
// State management using ChangeNotifier
// Owns validation, random number generation, and play logic

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/domain/entities/lottery_result.dart';

class LotteryProvider extends ChangeNotifier {
  final Random _random = Random();

  int? _selectedNumber;
  LotteryResult? _lotteryResult;
  String? _errorMessage;

  int? get selectedNumber => _selectedNumber;
  LotteryResult? get lotteryResult => _lotteryResult;
  String? get errorMessage => _errorMessage;

  bool get canPlay => _selectedNumber != null;

  /// Returns true if [number] is a valid lottery pick (1–10).
  bool isValidNumber(int number) => number >= 1 && number <= 10;

  void setSelectedNumber(int? number) {
    _selectedNumber = number;
    _errorMessage = null;
    notifyListeners();
  }

  void playLottery() {
    _errorMessage = null;

    if (_selectedNumber == null) {
      _errorMessage = AppStrings.selectNumberError;
      notifyListeners();
      return;
    }

    if (!isValidNumber(_selectedNumber!)) {
      _errorMessage = AppStrings.numberRangeError;
      notifyListeners();
      return;
    }

    final int winningNumber = _random.nextInt(10) + 1;
    final bool isWinner = _selectedNumber == winningNumber;

    _lotteryResult = LotteryResult(
      userNumber: _selectedNumber!,
      winningNumber: winningNumber,
      isWinner: isWinner,
    );

    notifyListeners();
  }

  void reset() {
    _selectedNumber = null;
    _lotteryResult = null;
    _errorMessage = null;
    notifyListeners();
  }
}
