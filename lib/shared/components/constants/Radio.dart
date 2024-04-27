import 'package:flutter/material.dart';

enum SingingCharacter { Kotlin, flutter }

class Radio_screen extends StatefulWidget {
  const Radio_screen({super.key});

  @override
  State<Radio_screen> createState() => _Radio_screenState();
}

class _Radio_screenState extends State<Radio_screen> {
  SingingCharacter? _character = SingingCharacter.Kotlin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Kotlin'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Kotlin,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('flutter'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.flutter,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
