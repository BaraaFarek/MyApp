import 'package:flutter/material.dart';

class Slider_screen extends StatefulWidget {
  const Slider_screen({super.key});

  @override
  State<Slider_screen> createState() => _Slider_screenState();
}

class _Slider_screenState extends State<Slider_screen> {
  double currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slider(
          value: currentSliderValue,
          label: currentSliderValue.round().toString(),
          divisions: 5,
          min: 0,
          max: 200,
          onChanged: (double value) {
            setState(() {
              currentSliderValue = value;
            });
          }),
    );
  }
}
