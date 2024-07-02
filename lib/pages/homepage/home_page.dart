import 'package:bust_design/common_layer.dart/first_layer.dart';
import 'package:bust_design/pages/homepage/layers/second_layer.dart';
import 'package:bust_design/pages/homepage/layers/third_layer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(left:0.0, top: 0.0, child:  FirstLayer()),
          Positioned(top: 260.0, left: 0.0, right: 0.0, child: SecondLayer()),
          Positioned(top: 324.0, bottom: 0.0, left: 0.0, right: 0.0, child: ThirdLayer()),
        ],
      ),
    );
  }
}