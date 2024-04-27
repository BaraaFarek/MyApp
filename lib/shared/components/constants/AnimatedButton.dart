import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class AnimatedButton_screen extends StatefulWidget {
  const AnimatedButton_screen({super.key});

  @override
  State<AnimatedButton_screen> createState() => _AnimatedButton_screenState();
}

class _AnimatedButton_screenState extends State<AnimatedButton_screen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation arrowanimation;
  late AnimationController arrowAnimationController;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    arrowAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    arrowanimation =
        Tween(begin: 0.0, end: pi).animate(arrowAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    arrowAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(child: firstChild()),
      ),
    );
  }

  Widget firstChild() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      onTap: () {
        setState(() {
          arrowAnimationController.isCompleted
              ? arrowAnimationController.reverse()
              : arrowAnimationController.forward();
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height: isTapped ? 45 : 50,
        width: isTapped ? 45 : 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: arrowanimation.value,
            child: Icon(
              Icons.expand_more,
              size: 30.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
