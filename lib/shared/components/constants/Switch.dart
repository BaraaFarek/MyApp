import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Switch_screen extends StatefulWidget {
  const Switch_screen({super.key});

  @override
  State<Switch_screen> createState() => _Switch_screenState();
}

class _Switch_screenState extends State<Switch_screen> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Material(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                  child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'wifi ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: CupertinoSwitch(
                      value: state,
                      onChanged: (value) {
                        state = value;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: CupertinoColors.systemGrey5,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                state == true ? 'wifi turned on' : 'wifi turned off ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: state == true
                      ? CupertinoColors.activeGreen
                      : CupertinoColors.destructiveRed,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
