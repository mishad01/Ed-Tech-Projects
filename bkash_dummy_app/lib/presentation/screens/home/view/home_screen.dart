import 'package:bkash_dummy_app/core/app_colors.dart';
import 'package:bkash_dummy_app/presentation/screens/home/widget/home_app_bar.dart';
import 'package:bkash_dummy_app/presentation/screens/home/widget/menu_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: HomeAppBar(),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          MenuGrid(),
          SizedBox(height: 16),
          Image.asset('assets/offfer_banner.png'),
        ],
      ),
    );
  }
}
