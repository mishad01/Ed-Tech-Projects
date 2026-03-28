// Screen - Entry Screen
// Allows the user to pick a lucky number (1–10) and play the lottery

import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/presentation/provider/lottery_provider.dart';
import 'package:lottery_app/presentation/widget/error_banner.dart';
import 'package:lottery_app/presentation/widget/gradient_scaffold.dart';
import 'package:lottery_app/presentation/widget/number_tile.dart';
import 'package:provider/provider.dart';
import 'result_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int? _selectedNumber;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryProvider>(context);
    return GradientScaffold(
      title: AppStrings.entryTitle,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Icon(Icons.casino, size: 80, color: AppColors.accentCyan),
              const SizedBox(height: 20),
              const Text(
                AppStrings.entryHeading,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppStrings.entrySubheading,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.whiteOpacity80),
              ),
              const SizedBox(height: 40),
              // Number picker grid
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppColors.glassGradient,
                  ),
                  border: Border.all(
                    color: AppColors.whiteOpacity30,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackOpacity10,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final number = index + 1;
                    return NumberTile(
                      number: number,
                      isSelected: _selectedNumber == number,
                      onTap: () {
                        setState(() => _selectedNumber = number);
                        provider.setSelectedNumber(number);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              if (provider.errorMessage != null)
                ErrorBanner(message: provider.errorMessage!),
              ElevatedButton(
                onPressed: _selectedNumber == null
                    ? null
                    : () {
                        provider.playLottery();
                        if (provider.errorMessage == null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResultScreen(),
                            ),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedNumber != null
                      ? AppColors.accentCyan
                      : AppColors.disabledGrey,
                  foregroundColor: AppColors.buttonForeground,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: _selectedNumber != null ? 12 : 4,
                  shadowColor: _selectedNumber != null
                      ? AppColors.cyanShadow
                      : Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 28,
                      color: _selectedNumber != null
                          ? AppColors.buttonForeground
                          : AppColors.disabledGreyLight,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      AppStrings.playLotteryAction,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: _selectedNumber != null
                            ? AppColors.buttonForeground
                            : AppColors.disabledGreyLight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  AppStrings.goodLuck,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.whiteOpacity80,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
