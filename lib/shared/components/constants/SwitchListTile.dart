import 'package:flutter/material.dart';

class SwitchListTile_screen extends StatefulWidget {
  const SwitchListTile_screen({super.key});

  @override
  State<SwitchListTile_screen> createState() => _SwitchListTile_screenState();
}

class _SwitchListTile_screenState extends State<SwitchListTile_screen> {
  bool lights = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SwitchListTile(
          value: lights,
          onChanged: (bool value) {
            setState(() {
              lights = value;
            });
          },
          secondary: Icon(Icons.lightbulb_outline),
        ),
      ),
    );
  }
}
