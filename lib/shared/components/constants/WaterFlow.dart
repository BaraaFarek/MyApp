import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class WaterFlow_screen extends StatefulWidget {
  const WaterFlow_screen({super.key});

  @override
  State<WaterFlow_screen> createState() => _WaterFlow_screecState();
}

class _WaterFlow_screecState extends State<WaterFlow_screen>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;
  late AnimationController secondController;
  late Animation<double> secondAnimation;
  late AnimationController thirdController;
  late Animation<double> thirdAnimation;
  late AnimationController fourthController;
  late Animation<double> fourthAnimation;
  late AnimationStatus status;
  @override
  void initState() {
    super.initState();
    // firstController = AnimationController(vsync: this ,
    //     duration: Duration(milliseconds: 1500));
    // firstAnimation = Tween<double>(begin: 1.9 , end: 2.1).animate
    //   (CurvedAnimation(parent: firstController, curve: Curves.easeInOut))..addListener(() {setState(() {});})..addListener(( AnimationStatus status) {
    //     if (status == AnimationStatus.completed){
    //       firstController.reverse();
    //     }
    //     else if (status == AnimationStatus.dismissed){
    //       firstController.forward();
    //     }
    // });
    Timer(Duration(seconds: 2), () {
      firstController.forward();
    });
    Timer(Duration(seconds: 1600), () {
      secondController.forward();
    });
    Timer(Duration(seconds: 800), () {
      thirdController.forward();
    });
    firstController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0Xff2B2C56),
      body: Stack(
        children: [
          Center(
            child: Text(
              '50%',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                wordSpacing: 3,
                color: Colors.white.withOpacity(0.7),
              ),
              textScaleFactor: 7,
            ),
          ),
          CustomPaint(
            painter: MyPainter(
              firstAnimation.value,
              secondAnimation.value,
              thirdAnimation.value,
              fourthAnimation.value,
            ),
            child: SizedBox(
              height: size.height,
              width: size.width,
            ),
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstvalue;
  final double secondvalue;
  final double thirdvalue;
  final double fourthvalue;
  MyPainter(
      this.firstvalue, this.secondvalue, this.thirdvalue, this.fourthvalue);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0Xff3B6ABA).withOpacity(0.8)
      ..style = PaintingStyle.fill;
    var path = Path()
      ..moveTo(0, size.height / firstvalue)
      ..cubicTo(size.width * 0.4, size.height / secondvalue, size.width * 0.7,
          size.height / thirdvalue, size.width, size.height / fourthvalue)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
