// Packages:
import 'package:flutter/material.dart';

// Screens:
import 'package:flash_chat_flutter_updated/screens/login_screen.dart';
import 'package:flash_chat_flutter_updated/screens/registration_screen.dart';

// Components:

// Helpers:

// Utilities:
import 'package:flash_chat_flutter_updated/utilities/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, // The Ticker (this current _WelcomeScreenState object)
      upperBound: 1, // It can't be greater than 1 with curved animations
    );
    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );

    // Animates from 0 to 1 in 60 steps:
    animationController.forward();

    // Animates in reverse:
    // animationController.reverse(from: 1.0);

    animationController.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        animationController.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    // The listener takes a callback. Gets executed in every tick of the ticker?
    animationController.addListener(() {
      setState(() {});
      print(animationController.value);
      print(curvedAnimation.value);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors.red.withOpacity(animationController.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'flash_logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: 60.0,
                    // height: animationController.value,
                    height: curvedAnimation.value * 100,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),

            // Login Screen button
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),

            // Registration Screen button
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
