// Packages:
import 'package:flutter/material.dart';

// Screens:

// Components:

// Helpers:

// Utilities:
import 'package:flash_chat_flutter_updated/utilities/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key key,
    @required this.color,
    @required this.routeName,
    @required this.label,
  }) : super(key: key);

  final Color color;
  final String routeName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        // color: Colors.blueAccent.withOpacity(curvedAnimation.value),
        // color: colorTweenAnimationRegister.value.withOpacity(animationController.value),
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
