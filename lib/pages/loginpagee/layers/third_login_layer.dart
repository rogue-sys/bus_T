import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThirdLoginLayer extends StatefulWidget {
  const ThirdLoginLayer({super.key});

  @override
  State<ThirdLoginLayer> createState() => _ThirdLoginLayerState();
}

class _ThirdLoginLayerState extends State<ThirdLoginLayer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3.0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          topRight: Radius.circular(60.0),
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Container(
              width: 270,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:const Color.fromARGB(255, 216, 226, 242),
                  focusColor: const Color.fromARGB(255, 216, 226, 242),
                  labelText: 'Email/Username',
                  labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.blue, width: 1.0,), // Border when focused
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(Icons.email_rounded,color: Colors.blue,),
                ),
              ),
            ),
    
            const SizedBox(height: 24.0),
    
             Container(
              width: 270,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:const Color.fromARGB(255, 216, 226, 242),
                  focusColor: const Color.fromARGB(255, 216, 226, 242),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.blue, width: 1.0,), // Border when focused
                    borderRadius: BorderRadius.circular(40.0),
                    
                  ),
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(Icons.lock,color: Colors.blue,),
                ),
              ),
            ),
    
    
            const SizedBox(height: 6.0),
    
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  CheckboxTheme(
                    data: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 0.7,
                      child: Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            //  setState(() {
                            //   isChecked = value ?? false;
                          }),
                    ),
                  ),
    
                  Container(
                    width: 99.0,
                    height: 24.0,
                    // color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: Text('Remember Me'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: SizedBox(
                  width: 25,
                  height: 20,
                  child: Image.asset(
                    'assets/google_icon.png',
                  ),
                ),
                label: const Text('Sign up with Google'),
              ),
            ),
            const SizedBox(height: 39.0),
          ],
        ),
      ),
    );
  }
}
