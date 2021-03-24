// Packages:
import 'package:flutter/material.dart';

// Screens:
import 'package:flash_chat_flutter_updated/screens/welcome_screen.dart';
import 'package:flash_chat_flutter_updated/screens/login_screen.dart';
import 'package:flash_chat_flutter_updated/screens/registration_screen.dart';
import 'package:flash_chat_flutter_updated/screens/chat_screen.dart';

// Components:

// Helpers:

// Utilities:
import 'package:flash_chat_flutter_updated/utilities/constants.dart';

void main() {
  runApp(FlashChatUpdated());
}

class FlashChatUpdated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      // home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,

      initialRoute: WelcomeScreen.id,
      // Routes
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
