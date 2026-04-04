import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/presentation/provider/recipe_provider.dart';
import 'package:recipe_book/presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: HomeScreen(),
      ),
    );
  }
}
