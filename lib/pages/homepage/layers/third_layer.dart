import 'dart:convert';
import 'package:bust_design/pages/loginpagee/already_login_page.dart';
import 'package:bust_design/pages/source_dest_page/source_dest.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdLayer extends StatefulWidget {
  const ThirdLayer({super.key});

  @override
  State<ThirdLayer> createState() => _ThirdLayerState();
}

class _ThirdLayerState extends State<ThirdLayer> {
  final _namecontroller = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showError = false;
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
            //Name textformfield
            Container(
              width: 270,
              height: 50,
             //color: Colors.red,
        
              child: TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 216, 226, 242),
                  focusColor: const Color.fromARGB(255, 216, 226, 242),
                  
                  labelText: 'Name',
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
            //username/email textformfield
            const SizedBox(height: 12.0),
           Container(
              width: 270,
             // color: Colors.red,
              height: 50,
              child: Form(
                key: _formKey,
                
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    //helperText: "",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 216, 226, 242),
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
                        color: Colors.blue,
                        width: 1.0,
                      ), // Border when focused
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: (value) {
                    setState((){
                      _showError = !_formKey.currentState!.validate();
                    });
                  },
                  validator: (value){
                    //check if the entered email is valid
                    if(value != null && value.isNotEmpty){
                      if(!isValidEmail(value)){
                        return 'enter valid email';
                      }
                    }
                    return null;
                  },
                ),
              ),
            ),
            //password textformfield
            const SizedBox(height: 12.0),
           Container(
              width: 270,
              height: 50,
              child: TextFormField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 216, 226, 242),
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
            //remember me
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
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
                    
                    alignment: Alignment.centerLeft,
                    child: const Text('Remember Me'),
                  ),
                ],
              ),
            ),
            //register button
            const SizedBox(height: 12.0),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Register'),
              ),
            ),
            //google login button
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
                style: ButtonStyle(
                  side: WidgetStateProperty.all<BorderSide>(
                    BorderSide(
                      color:
                          Colors.blue.withOpacity(0.2), // Adjust opacity here
                      width: 1, // Adjust border width
                    ),
                  ),
                ),
              ),
            ),
            //login here for already have an account users
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
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
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

 void registerUser() async{
    if(_namecontroller.text.isNotEmpty && _usernameController.text.isNotEmpty && _passwordcontroller.text.isNotEmpty){

      var regBody = {
        "name":_namecontroller.text,
        "email": _usernameController.text,
        "password":_passwordcontroller.text,
      };

      var response = await http.post(Uri.parse('http://192.168.20.3:5000/api/users/registration'),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(regBody)
      );
      
       if (response.statusCode == 200) {
        // Handle successful registration
        print('Registration successful');
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const  SourceDest()));

      } else {
        // Handle registration failure
        print('Registration failed');
      }
    }
    else{
     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const  Text('Error'),
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


   bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
