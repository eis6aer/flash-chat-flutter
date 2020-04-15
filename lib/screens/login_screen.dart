import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/flash_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const route = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  keyboardType: TextInputType.emailAddress,
                  controller: _userController,
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  decoration: kInputStyle.copyWith(
                    hintText: 'Enter your email',
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
                  buttonText: 'Log In',
                  buttonColor: Colors.lightBlueAccent,
                  callback: () async {
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(email: _userController.text, password: _passwordController.text);

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
