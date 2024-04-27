import 'package:flutter/material.dart';

class archived_screen extends StatelessWidget {
  const archived_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'archived',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
