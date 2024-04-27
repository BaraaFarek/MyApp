import 'package:flutter/material.dart';

class done_screen extends StatelessWidget {
  const done_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'done',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
