import 'package:flutter/material.dart';
import 'package:bust/splashscreen.dart';

void main() {
  runApp(BusTApp());
}

class BusTApp extends StatelessWidget {
  const BusTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusT App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Changed to SplashScreen as the initial screen
    );
  }
}

