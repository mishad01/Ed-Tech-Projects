import 'package:bmi_calculator_app/presentation/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows validation errors when inputs are empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: BmiCalculatorScreen()),
    );

    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(find.text('Please enter your height'), findsOneWidget);
    expect(find.text('Please enter your weight'), findsOneWidget);
  });
}
