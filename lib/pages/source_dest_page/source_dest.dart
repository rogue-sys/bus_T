import 'package:bust_design/navbar.dart';
import 'package:bust_design/pages/source_dest_page/layers/src_dest_layer1.dart';
import 'package:bust_design/pages/source_dest_page/layers/src_dest_layer2.dart';
import 'package:bust_design/pages/source_dest_page/layers/src_dest_layer3.dart';
import 'package:flutter/material.dart';

class SourceDest extends StatelessWidget {
  const SourceDest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Navbar(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: const Stack(
        children: <Widget>[
           Positioned(left:0.0, top: 0.0, bottom: 0.0, right: 0.0, child:  SrcDestLayer1()),
          Positioned(top: 180.0, left: 20.0, right: 20.0, child: SrcDestLayer2()),
          Positioned(top: 250.0, bottom: 130.0, left: 20.0, right: 20.0, child: SrcDestLayer3()),
        ],
      ),
    );
  }
}