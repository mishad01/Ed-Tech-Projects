// Screen - Result Screen
// Displays the lottery result with win/lose state

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/presentation/provider/lottery_provider.dart';
import 'package:lottery_app/presentation/widget/gradient_scaffold.dart';
import 'package:lottery_app/presentation/widget/result_icon.dart';
import 'package:lottery_app/presentation/widget/result_number_card.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LotteryProvider>();
    final result = provider.lotteryResult;

    if (result == null) {
      return const GradientScaffold(
        title: AppStrings.resultTitle,
        body: Center(
          child: Text(
            AppStrings.noResultFound,
            style: TextStyle(color: AppColors.white, fontSize: 18),
          ),
        ),
      );
    }

    return GradientScaffold(
      title: AppStrings.resultTitle,
      showBackButton: false,
      gradientColors: result.isWinner ? AppColors.winGradient : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResultIcon(isWinner: result.isWinner),
                  const SizedBox(height: 24),
                  Text(
                    result.isWinner
                        ? AppStrings.resultWin
                        : AppStrings.resultLose,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ResultNumberCard(result: result),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () {
                      provider.reset();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (_) => false,
                      );
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text(
                      AppStrings.tryAgainButton,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.buttonForeground,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    result.isWinner
                        ? AppStrings.congratsMessage
                        : AppStrings.encourageMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.whiteOpacity90,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
