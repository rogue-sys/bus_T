
import 'package:bust/layers/SourceDestinationLayer.dart';
import 'package:flutter/material.dart';
import 'package:bust/layers/FirstLayer.dart';
import 'package:bust/layers/SecondLayer.dart';

class SourceDestination extends StatelessWidget {
  const SourceDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/primaryBg.png'),
          fit: BoxFit.cover,
        ),
      ),
        padding: const EdgeInsets.all(20.0),
       
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children:<Widget>[
            Positioned(
              top: 200,
              left: 59,
              child: Container(
                child: Text(
                  'Enter Places',
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(top: 290, right: 0, bottom: 0, child: FirstLayer()),
            Positioned(top: 318, right: 0, bottom: 28, child: SecondLayer()),
            Positioned(top: 320, right: 0, bottom: 48, child: SourceDestinationLayer()),
          ],
        ),
      ),
    );
  }
}
