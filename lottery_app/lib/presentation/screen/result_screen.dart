import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/presentation/provider/lottery_provider.dart';
import 'package:lottery_app/presentation/widget/gradient_scaffold.dart';
import 'package:lottery_app/presentation/widget/result_icon.dart';
import 'package:lottery_app/presentation/widget/result_number_card.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryProvider>(context);
    final result = provider.getLotteryResult;
    return GradientScaffold(
      showBackButton: true,
      title: AppStrings.resultTitle,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ResultIcon(isWinner: result?.isWinner ?? false),
              ResultNumberCard(result: result!),
            ],
          ),
        ),
      ),
    );
  }
}
