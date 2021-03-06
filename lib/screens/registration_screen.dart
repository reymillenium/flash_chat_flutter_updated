// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:
import 'package:flash_chat_flutter_updated/components/auth_button.dart';
import 'package:flash_chat_flutter_updated/components/user_input.dart';

// Helpers:

// Utilities:
import 'package:flash_chat_flutter_updated/utilities/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
            Hero(
              tag: 'flash_logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),

            // User Input: Email
            UserInput(
              hintText: 'Enter your email',
            ),

            SizedBox(
              height: 8.0,
            ),

            // User Input: Password
            UserInput(
              hintText: 'Enter your password',
            ),

            SizedBox(
              height: 24.0,
            ),

            // Registration Screen button
            Hero(
              tag: 'register_button',
              child: AuthButton(
                color: Colors.blueAccent,
                onPressed: null,
                label: 'Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
