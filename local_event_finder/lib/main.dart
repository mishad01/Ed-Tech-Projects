import 'package:flutter/material.dart';
import 'package:local_event_finder/data/service/event_service.dart';
import 'package:local_event_finder/presentation/provider/event_provider.dart';
import 'package:local_event_finder/presentation/screens/home/home_screen.dart';
import 'package:local_event_finder/presentation/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(EventService()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SplashScreen(),
      ),
    );
  }
}
