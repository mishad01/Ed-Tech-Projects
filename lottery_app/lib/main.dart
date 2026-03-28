import 'package:flutter/material.dart';
import 'package:lottery_app/presentation/provider/lottery_provider.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LotteryProvider(),

      child: MaterialApp(
        title: 'Mini Lottery',

        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: Brightness.light,
          ),

          useMaterial3: true,

          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
        ),

        home: const HomeScreen(),
      ),
    );
  }
}
