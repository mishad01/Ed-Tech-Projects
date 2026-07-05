import 'package:bkash_dummy_app/core/app_colors.dart';
import 'package:bkash_dummy_app/presentation/home/provider/home_provider.dart';
import 'package:bkash_dummy_app/presentation/home/widget/menu_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 8,
          children: [
            CircleAvatar(child: Icon(Icons.person, size: 20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sakif Rahaman",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 30,
                  width: 136,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "৳",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      GestureDetector(
                        onDoubleTap: () {
                          Provider.of<HomeProvider>(
                            context,
                            listen: false,
                          ).toggleBalanceTapped();
                        },
                        child: Text(
                          "Tap for Balance",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Handle notification icon press
                    },
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Image.asset(
                      '/Users/sakif/Documents/work/Ed-Tech-Projects/bkash_dummy_app/assets/bkash.png',
                      height: 24,
                      width: 24,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      // Handle notification icon press
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(children: [MenuGrid()]),
    );
  }
}
