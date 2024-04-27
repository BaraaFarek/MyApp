import 'package:flutter/material.dart';

class Alertdialog_screen extends StatelessWidget {
  const Alertdialog_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'حدث مشكلة أثناء الاتصال',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          AlertDialog(
            title: Text('there is an error'),
            content: Text('حدث خطأ أثناء الاتصال الرجاء المحاولة لاحقاً'),
            actions: <Widget>[
              TextButton(onPressed: () {}, child: Text('cancel')),
              TextButton(onPressed: () {}, child: Text('ok')),
            ],
          ),
        ],
      ),
    );
  }
}
