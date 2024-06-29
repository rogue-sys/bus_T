import 'package:flutter/material.dart';
import 'package:bust/config.dart';

class FirstLayer extends StatelessWidget {
  const FirstLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 654,
      decoration: BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0), bottomRight: Radius.circular(60.0)),
      ),
    );
  }
}
