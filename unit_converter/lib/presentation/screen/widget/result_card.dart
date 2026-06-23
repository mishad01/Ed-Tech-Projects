import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConverterProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(80),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(
                AppStrings.resultLabel,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                provider.result,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
