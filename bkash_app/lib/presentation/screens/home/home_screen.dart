import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: HomeAppBar(),
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        spacing: 12,
        children: [MenuGrid(), Image.asset('assets/offfer_banner.png')],
      ),
    );
  }
}
