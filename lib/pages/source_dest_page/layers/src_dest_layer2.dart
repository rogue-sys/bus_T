import 'package:flutter/material.dart';

class SrcDestLayer2 extends StatelessWidget {
  const SrcDestLayer2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
              margin: EdgeInsets.zero,
              
              
              color: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                ),
              ),
              child: Container(
                width: 150.0,
                height: 150.0,
               // color: Colors.yellow,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Enter the places',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        //fontWeight: FontWeight.bold
                      ),),),
                ),
              ),
            );
  }
}