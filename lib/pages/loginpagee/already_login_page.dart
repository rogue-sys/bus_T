import 'package:bust_design/common_layer.dart/first_layer.dart';
import 'package:bust_design/pages/loginpagee/layers/second_login_layer.dart';
import 'package:bust_design/pages/loginpagee/layers/third_login_layer.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(left:0.0, top: 0.0, child:  FirstLayer()),
          Positioned(top: 260.0, left: 0.0, right: 0.0, child: SecondLoginLayer()),
          Positioned(top: 324.0, bottom: 0.0, left: 0.0, right: 0.0, child: ThirdLoginLayer()),
        ],
      ),
    );
  }
}