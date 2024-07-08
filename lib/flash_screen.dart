import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bust_design/pages/homepage/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showFirstImage = true;
  Timer? _timer; // Declare a Timer variable

  @override
  void initState() {
    super.initState();
    // Initialize the timer and store it in _timer
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      setState(() {
        _showFirstImage = !_showFirstImage;
      });
    });

    // Navigate to HomePage after 5 seconds
    Timer(Duration(seconds: 4), () {
      if (mounted) {
        // Check if the widget is still mounted
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer in the dispose method
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image transition effect
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: _showFirstImage
                    ? Image.asset(
                        'assets/image1.png',
                        key: Key('first'),
                      )
                    : Image.asset(
                        'assets/image2.png',
                        key: Key('second'),
                      ),
              ),
              SizedBox(height: 20),
              Text(
                'Your App Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
