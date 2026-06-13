import 'package:bmi_calculator_app/core/app_colors.dart';
import 'package:bmi_calculator_app/presentation/widgets/bmi_reference_table.dart';
import 'package:bmi_calculator_app/presentation/widgets/input_card.dart';
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
  Color _categoryColor = AppColors.normal;

  void _calculate() {
    final heightCm = double.parse(_heightController.text);
    final weightKg = double.parse(_weightController.text);

    final heightM = heightCm / 100;

    final bmi = weightKg / (heightM * heightM);

    final (category, categoryColor) = _classify(bmi);

    setState(() {
      _bmi = bmi;
      _category = category;
      _categoryColor = categoryColor;
    });
  }

  // ignore: strict_top_level_inference
  (String, Color) _classify(double bmi) {
    if (bmi < 18.5) return ('Underweight', AppColors.underweight);
    if (bmi < 25) return ('Normal weight', AppColors.normal);
    if (bmi < 30) return ('Overweight', AppColors.overweight);
    return ('Obese', AppColors.obese);
  }

  void _reset() {
    _heightController.clear();
    _weightController.clear();
    setState(() {
      _bmi = null;
      _category = '';
      _categoryColor = AppColors.normal;
    });
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 16,
            children: [
              InputCard(
                heightController: _heightController,
                weightController: _weightController,
              ),
              ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButton,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Calculate'),
              ),
              Text(_bmi.toString()),
              BmiReferenceTable(),
            ],
          ),
        ),
      ),
    );
  }
}
