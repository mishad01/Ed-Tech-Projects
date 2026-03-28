import 'package:flutter/material.dart';
import 'package:music_player/presentation/screen/home/home_screen.dart';
import 'package:music_player/presentation/screen/home/provider/media_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MediaProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const HomeScreen(),
      ),
    );
  }
}
