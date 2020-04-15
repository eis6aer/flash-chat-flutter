import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/flash_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const route = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'hero_lightning',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: _userController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: Colors.grey
                  ),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: kInputStyle.copyWith(
                      hintText: 'Enter your email'
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(
                      color: Colors.grey
                  ),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: kInputStyle.copyWith(
                      hintText: 'Enter your password'
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                FlashButton(
                  buttonText: 'Register',
                  buttonColor: Colors.blueAccent,
                  callback: () async {
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: _userController.text, password: _passwordController.text);

                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.route);
                      }

                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
