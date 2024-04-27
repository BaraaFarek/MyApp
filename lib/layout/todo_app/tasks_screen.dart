import 'package:flutter/material.dart';

class Tasks_screen extends StatelessWidget {
  const Tasks_screen({super.key});
// without Scaffold because home screen has a Scaffold
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'new task',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
