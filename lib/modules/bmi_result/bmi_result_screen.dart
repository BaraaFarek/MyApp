import 'package:flutter/material.dart';

class Bmi_result_screen extends StatelessWidget {

 final int result;
 final bool isMale;
 final int age;
 const Bmi_result_screen({super.key,
    required this.result,
   required this.age,
   required this.isMale,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('result'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale ? 'Male' : 'Female'} ' ,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),),
            Text(' result : $result ' ,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),),
            Text('age : $age ' ,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),)
        ],),
      ),
    );
  }
}
