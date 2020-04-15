import 'package:flash_chat/widgets/flash_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const route = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1
    );

//    animation = CurvedAnimation(
//      parent: controller,
//      curve: Curves.easeIn
//    );

    // controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        // controller.reverse(from: 1.0);
//      } else if (status == AnimationStatus.dismissed) {
//        // controller.forward();
//      }
//    });

//    controller.addListener(() {
//      setState(() {});
//    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "hero_lightning",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: Duration(milliseconds: 250),
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            FlashButton(
                buttonText: 'Log In',
                buttonColor: Colors.lightBlueAccent,
                callback: () {
                  Navigator.of(context).pushNamed(LoginScreen.route);
                }
            ),
            FlashButton(
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              callback: () {
                Navigator.of(context).pushNamed(RegistrationScreen.route);
              }
            ),
          ],
        ),
      ),
    );
  }
}
