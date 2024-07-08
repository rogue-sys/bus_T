import 'package:flutter/material.dart';
import 'package:bust_design/pages/homepage/home_page.dart';
import 'package:bust_design/pages/loginpagee/already_login_page.dart';
import 'package:bust_design/pages/source_dest_page/source_dest.dart';
import 'package:bust_design/flash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}
