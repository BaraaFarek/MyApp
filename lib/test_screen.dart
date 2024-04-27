import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';

class test_Screen extends StatefulWidget {
  const test_Screen({super.key});
  @override
  State<test_Screen> createState() => _test_ScreenState();
}

class _test_ScreenState extends State<test_Screen> {
  _getString() async {
    var res = await http.get(Uri.parse("http://192.168.91.126/categories/8"));
    if (res.statusCode == 200) return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = app_cubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: FutureBuilder(
        future: _getString(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Text(snapshot.data.toString(),
                style: TextStyle(fontSize: 33.0));
          return Text('hello');
        },
      ),
    );
  }
}
