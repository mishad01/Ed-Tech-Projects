import 'package:bmi_calculator_app/core/colors/app_colors.dart';
import 'package:bmi_calculator_app/presentation/widget/bmi_reference_table.dart';
import 'package:bmi_calculator_app/presentation/widget/input_card.dart';
import 'package:bmi_calculator_app/presentation/widget/result_card.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double? _bmi;
  String? _category = '';
  Color _categoryColor = AppColors.normal;

  void calculate() {
    final heightCm = double.parse(_heightController.text);
    final weightKg = double.parse(_weightController.text);

    final heightM = heightCm / 100;

    final bmi = weightKg / (heightM * heightM);

    final (category, color) = _classify(bmi);

    setState(() {
      _bmi = bmi;
      _category = category;
      _categoryColor = color;
    });
  }

  (String, Color) _classify(double bmi) {
    if (bmi < 18.5)
      return ('Underweight', AppColors.underweight);
    else if (bmi < 25)
      return ('Normal', AppColors.normal);
    else if (bmi < 30)
      return ('Overweight', AppColors.overweight);
    else
      return ('Obese', AppColors.obese);
  }

  void reset() {
    _heightController.clear();
    _weightController.clear();

    setState(() {
      _bmi = null;
      _category = '';
      _categoryColor = AppColors.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.appBarForeground,
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  InputCard(
                    heightController: _heightController,
                    weightController: _weightController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calculate();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryButton,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Calculate BMI'),
                  ),

                  if (_bmi != null) ...[
                    ResultCard(
                      bmi: _bmi!,
                      category: _category!,
                      categoryColor: _categoryColor,
                    ),

                    TextButton(onPressed: reset, child: Text('Reset')),
                  ],

                  BmiReferenceTable(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
