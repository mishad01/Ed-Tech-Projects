import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/presentation/provider/lottery_provider.dart';
import 'package:lottery_app/presentation/screen/result_screen.dart';
import 'package:lottery_app/presentation/widget/gradient_scaffold.dart';
import 'package:lottery_app/presentation/widget/number_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedNumber;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryProvider>(context);
    return GradientScaffold(
      title: AppStrings.homeTitle,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 15,
              children: [
                Icon(Icons.casino, size: 100, color: AppColors.accentCyan),
                Text(
                  AppStrings.entryHeading,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  textAlign: .center,
                ),
                Text(
                  AppStrings.entrySubheading,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteOpacity80,
                  ),
                  textAlign: .center,
                ),
                Container(
                  padding: .all(24),
                  decoration: BoxDecoration(
                    borderRadius: .circular(25),
                    gradient: LinearGradient(
                      begin: .topLeft,
                      end: .bottomRight,
                      colors: AppColors.glassGradient,
                    ),
                    border: .all(color: AppColors.whiteOpacity30, width: 1.5),
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultScreen()),
                    );
                  },
                  child: Text(AppStrings.playLotteryAction),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
