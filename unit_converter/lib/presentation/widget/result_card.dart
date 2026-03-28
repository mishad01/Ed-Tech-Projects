import 'package:flutter/cupertino.dart';
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
          padding: .all(20),
          width: .infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary.withAlpha(80),
          ),
          child: Column(
            children: [
              Text(
                AppStrings.resultLabel,
                style: TextStyle(fontSize: 20, fontWeight: .w600),
              ),
              Text(
                provider.result,
                style: TextStyle(fontSize: 20, fontWeight: .w600),
              ),
            ],
          ),
        );
      },
    );
  }
}
