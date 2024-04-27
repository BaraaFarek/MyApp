import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class signup_screen extends StatelessWidget {
  const signup_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello honey  ',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.heart_broken_sharp)
        ],
      ),
    ));
  }
}
