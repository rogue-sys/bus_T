import 'package:flutter/material.dart';

class SecondLayer extends StatelessWidget {
  const SecondLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
              margin: EdgeInsets.zero,
              elevation: 3.0,
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
                width: double.infinity,
                height: 150.0,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Create new account',
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