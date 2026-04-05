import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';
import 'package:lottery_app/core/app_strings.dart';
import 'package:lottery_app/presentation/widget/gradient_scaffold.dart';
import 'package:lottery_app/presentation/widget/number_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: AppStrings.homeTitle,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 15,
          children: [
            SizedBox(height: 200),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final number = index + 1;
                  return Text('1');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
