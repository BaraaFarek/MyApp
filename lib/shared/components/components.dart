import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  // as default
  double width = 100, // common use
  Color background = Colors.blue,
  bool isUpperCase = true,
  required void function,
  required String text,
  // Function onpressed = () { },
  double radius = 20,
}) =>
    Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
