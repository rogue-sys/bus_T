import 'package:flutter/material.dart';

class FirstLayer extends StatelessWidget {
  const FirstLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 398,
              height: 270,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/top_img1.jpg"), 
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
  }
}