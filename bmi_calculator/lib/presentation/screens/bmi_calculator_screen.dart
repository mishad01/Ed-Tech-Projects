import 'package:bmi_calculator/core/colors/app_colors.dart';
import 'package:bmi_calculator/presentation/widget/bmi_reference_table.dart';
import 'package:bmi_calculator/presentation/widget/input_card.dart';
import 'package:bmi_calculator/presentation/widget/result_card.dart';
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
  String _category = '';
  Color _categoryColor = Colors.transparent;

  void _calculate() {
    final heightCm = double.parse(_heightController.text);
    final weightKg = double.parse(_weightController.text);

    final heightM = heightCm / 100;

    //BMI = weight (kg) / [height (m)]^2
    final bmi = weightKg / (heightM * heightM);
    final (category, color) = _classify(bmi);

    setState(() {
      _bmi = bmi;
      _category = category;
      _categoryColor = color;
    });
  }

  (String, Color) _classify(double bmi) {
    if (bmi < 18.5) return ('UnderWeigt', AppColors.underweight);
    if (bmi < 25) return ('Normal', AppColors.normal);
    if (bmi < 30)
      return ('Overweight', AppColors.overweight);
    else
      return ('Obese', AppColors.obese);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackground,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: AppColors.appBarBackground,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputCard(
                    heightController: _heightController,
                    weightController: _weightController,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryButton,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _calculate();
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                  if (_bmi != null)
                    ResultCard(
                      bmi: _bmi!,
                      category: _category,
                      categoryColor: _categoryColor,
                    ),
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
