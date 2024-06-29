import 'package:flutter/material.dart';
import 'package:bust/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bust/sourcedestination.dart';

class ThirdLayer extends StatefulWidget {
  ThirdLayer({super.key});

  @override
  State<ThirdLayer> createState() => _ThirdLayerState();
}

class _ThirdLayerState extends State<ThirdLayer> {
  final _usernameController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showError = false;
  @override
  void initState() {
    super.initState();
    // Check for stored credentials when the app starts
    checkStoredCredentials();
  }

  Future<void> checkStoredCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');
    if (storedUsername != null && storedPassword != null) {
      print('Stored email: $storedUsername');
      print('Stored password: $storedPassword');
      // Automatically log in the user if credentials are stored
      _usernameController.text = storedUsername;
      _passwordcontroller.text = storedPassword;
      // Perform login action here
    }
  }

  Future<void> storeCredentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    //bool isChecked = false;

    return Container(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          const Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Username',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 129,
              child: Container(
                width: 310,
                alignment: Alignment.topLeft,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter User ID or Email',
                      hintStyle: TextStyle(color: hintText),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _showError = !_formKey.currentState!.validate();
                      });
                    },
                    validator: (value) {
                      //check if the entered email is valid
                      if (value != null && value.isNotEmpty) {
                        if (!isValidEmail(value)) {
                          return 'Enter a valid email';
                        }
                      }
                      return null;
                    },
                  ),
                ),
              )),
          const Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Password',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            left: 59,
            top: 229,
            child: Container(
              width: 310,
              alignment: Alignment.topCenter,
              child: TextFormField(
                controller: _passwordcontroller,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: hintText),
                ),
              ),
            ),
          ),
          const Positioned(
              right: 60,
              top: 296,
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    color: forgotPasswordText,
                    fontSize: 16,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w600),
              )),
          // Positioned(
          //     left: 46,
          //     top: 361,
          //     child: Checkbox(
          //       checkColor: Colors.black,
          //       activeColor: checkbox,
          //       value: isChecked,
          //       onChanged: (bool? value) {
          //         isChecked = value!;
          //       },
          //     )),
          // const Positioned(
          //     left: 87,
          //     top: 375,
          //     child: Text(
          //       'Remember Me',
          //       style: TextStyle(
          //           color: forgotPasswordText,
          //           fontSize: 16,
          //           fontFamily: 'Poppins-Medium',
          //           fontWeight: FontWeight.w500),
          //     )),
          // Positioned(
          //   top: 365,
          //   right: 60,
          //   child: GestureDetector(
          //     onTap: () {
          //       checkLogin();
          //     },
          //     child: Container(
          //       width: 140,
          //       height: 35,
          //       decoration: const BoxDecoration(
          //         color: signInButton,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             bottomRight: Radius.circular(20)),
          //       ),
          //       child: const Padding(
          //         padding: EdgeInsets.only(top: 6.0),
          //         child: Text(
          //           'Sign In',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 18,
          //               fontFamily: 'Poppins-Medium',
          //               fontWeight: FontWeight.w400),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
         Positioned(
  top: 365,
  left: MediaQuery.of(context).size.width / 2 - 75,
  right: MediaQuery.of(context).size.width / 2 - 75,
  child: SizedBox(
    height: 40,
    child: ElevatedButton.icon(
      onPressed: () {
        checkLogin();
      },
      icon: const Icon(Icons.check),
      label: const Text('Login'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 40),
        backgroundColor: signInBox,
      ),
    ),
  ),
),

          Positioned(
              top: 432,
              left: 59,
              child: Container(
                height: 0.5,
                width: 310,
                color: inputBorder,
              )),
          /*Positioned(
              top: 482,
              left: 120,
              right: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: signInBox),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'images/icon_google.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        color: hintText),
                  ),
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: signInBox),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'images/icon_apple.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                ],
              ))*/
        ],
      ),
    );
  }

  void checkLogin() {
    final _username = _usernameController.text;
    final _password = _passwordcontroller.text;

    if (_username.isNotEmpty && _password.isNotEmpty && isValidEmail(_username)) {
    //store credentials automatically
    storeCredentials(_username, _password);
    //navigate to source-destination page
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SourceDestination()));}

    else {
       // Show alert dialog for invalid information
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Please enter a valid email and password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    }
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

