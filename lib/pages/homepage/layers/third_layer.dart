import 'package:bust_design/pages/loginpagee/already_login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ThirdLayer extends StatefulWidget {
  const ThirdLayer({super.key});

  @override
  State<ThirdLayer> createState() => _ThirdLayerState();
}

class _ThirdLayerState extends State<ThirdLayer> {
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
                    Container(
                      width: 290,
                      height: 50,
                      // color: Colors.red,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      width: 290,
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username or Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      width: 290,
                      height: 50,
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 37.0),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: 100.0,
                    //         height: 19.0,
                    //         // color: Colors.red,
                    //         alignment: Alignment
                    //             .centerLeft, // Align text to the left within the container

                    //         child: const Text('Remember Me'),
                    //       ),
                    //       SizedBox(
                    //         child: Checkbox(
                    //           value: false,
                    //           onChanged: (value) {},
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Row(
                        children: [
                          Container(
                            width: 99.0,
                            height: 24.0,
                            //color: Colors.red,
                            alignment: Alignment.centerLeft,
                            child: const Text('Remember Me'),
                          ),
                          CheckboxTheme(
                            data: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                           // SizedBox(width: 8.0),
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
                        child: const Text('Register'),
                      ),
                    ),
                    const SizedBox(height: 12.0),
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
                   GestureDetector(
  onTap: () {},
  child: RichText(
    text: TextSpan(
      text: 'Already have an account? ',
      style: const TextStyle(color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: 'Login here',
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.none,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()), );
            },
        ),
      ],
    ),
  ),
)
                  ],
                ),
              ),
            );
  }
}