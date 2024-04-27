import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyFavotire_screen extends StatefulWidget {
  const MyFavotire_screen({super.key});

  @override
  State<MyFavotire_screen> createState() => _MyFavotireState();
}

class _MyFavotireState extends State<MyFavotire_screen> {
  bool isPressed = true;
  bool isHighlighted = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onHighlightChanged: (value) {
              setState(() {
                isHighlighted = !isHighlighted;
              });
            },
            onTap: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            child: AnimatedContainer(
              height: isHighlighted ? 50 : 45,
              width: isHighlighted ? 50 : 45,
              margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: isPressed
                  ? Icon(
                      Icons.favorite_border,
                      color: Colors.black.withOpacity(0.6),
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.pink.withOpacity(1.0),
                    ),
            ),
          ),
        ],
      )),
    );
  }
}
