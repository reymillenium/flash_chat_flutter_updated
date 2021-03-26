// Packages:
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// Screens:
import 'package:flash_chat_flutter_updated/screens/login_screen.dart';
import 'package:flash_chat_flutter_updated/screens/registration_screen.dart';

// Components:
import 'package:flash_chat_flutter_updated/components/auth_button.dart';

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
  Animation colorTweenAnimationBackground;
  Animation colorTweenAnimationLogin;
  Animation colorTweenAnimationRegister;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, // The Ticker (this current _WelcomeScreenState object)
      upperBound: 1, // It can't be greater than 1 with curved animations
    );

    // Curved Animation:
    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );

    // Tween Animations:
    colorTweenAnimationBackground = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(animationController);

    colorTweenAnimationLogin = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.lightBlueAccent,
    ).animate(animationController);

    colorTweenAnimationRegister = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.blueAccent,
    ).animate(animationController);

    // Animates from 0 to 1 in 60 steps:
    animationController.forward();

    // Animates in reverse:
    // animationController.reverse(from: 1.0);

    // animationController.addStatusListener((status) {
    //   print(status);
    //   if (status == AnimationStatus.completed) {
    //     animationController.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     animationController.forward();
    //   }
    // });

    // The listener takes a callback. Gets executed in every tick of the ticker?
    animationController.addListener(() {
      setState(() {});
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
      // backgroundColor: Colors.white,
      // backgroundColor: Colors.red.withOpacity(animationController.value),
      backgroundColor: colorTweenAnimationBackground.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // App Logo:
                Hero(
                  tag: 'flash_logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: 60.0,
                    // height: animationController.value,
                    height: curvedAnimation.value * 100,
                  ),
                ),

                // App Title:
                TextLiquidFill(
                  waveDuration: Duration(seconds: 2),
                  loadDuration: Duration(seconds: 4),
                  text: 'Flash Chat',
                  waveColor: Colors.black,
                  boxBackgroundColor: colorTweenAnimationBackground.value,
                  textStyle: TextStyle(
                    // backgroundColor: Colors.black,
                    // color: Colors.black,
                    // decorationColor: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                  boxHeight: 100.0,
                  boxWidth: 230.0,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // SizedBox(
            //   height: (148.0 - (curvedAnimation.value ?? 1.0) * 100),
            // ),
            // Login Screen button
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                // color: Colors.lightBlueAccent.withOpacity(curvedAnimation.value),
                // color: colorTweenAnimationLogin.value.withOpacity(animationController.value),
                color: colorTweenAnimationLogin.value,
                borderRadius: BorderRadius.circular(12.0),
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
            AuthButton(
              color: colorTweenAnimationRegister.value,
              routeName: RegistrationScreen.id,
              label: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
