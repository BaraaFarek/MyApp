import 'package:flutter/material.dart';

class Container_widget extends StatelessWidget {
  Container_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(25)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'assets/images/photo1.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Center(
              child: Text(
                'fashion',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade100,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
