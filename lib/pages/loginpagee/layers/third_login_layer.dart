import 'package:bust_design/pages/source_dest_page/source_dest.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';

class ThirdLoginLayer extends StatefulWidget {
  const ThirdLoginLayer({super.key});

  @override
  State<ThirdLoginLayer> createState() => _ThirdLoginLayerState();
}

class _ThirdLoginLayerState extends State<ThirdLoginLayer> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

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
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 216, 226, 242),
                  focusColor: const Color.fromARGB(255, 216, 226, 242),
                  labelText: 'Enter username/email',
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
                      color: Colors.blue,
                      width: 1.0,
                    ), // Border when focused
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: 270,
              height: 50,
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 216, 226, 242),
                  focusColor: const Color.fromARGB(255, 216, 226, 242),
                  labelText: ' Enter Password',
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
                      color: Colors.blue,
                      width: 1.0,
                    ), // Border when focused
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
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
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
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
                onPressed: () {
                  loginUser();
                },
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
              //color: Colors.amber,
              child: ElevatedButton.icon(
                onPressed: _handleGoogleSignIn,
                icon: SizedBox(
                  width: 25,
                  height: 20,
                  child: Image.asset(
                    'assets/google_icon.png',
                  ),
                ),
                label: const Text('Sign up with Google'),
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: Colors.blue.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 39.0),
          ],
        ),
      ),
    );
  }

  void _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      var response = await http.post(
        Uri.parse('http://192.168.20.3:5000/api/users/googleSignIn'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"token": googleAuth.idToken}),
      );

      if (response.statusCode == 200) {
        print('Google sign-in successful');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SourceDest()));
      } else {
        print('Google sign-in unsuccessful');
      }
    } catch (error) {
      print('Google sign-in error: $error');
    }
  }

  void loginUser() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var regBody = {
        "email": _usernameController.text,
        "password": _passwordController.text,
      };

      var response = await http.post(
        Uri.parse('http://192.168.20.3:5000/api/users/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        print('Login successful');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SourceDest()));
      } else {
        print('Login unsuccessful');
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter proper info'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
