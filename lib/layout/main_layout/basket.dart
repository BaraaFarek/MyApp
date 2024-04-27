import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/categories_cubit/categories_cubit.dart';
import 'package:untitled/categories_cubit/categories_state.dart';
import 'package:untitled/category_model.dart';
import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/models/one_category.dart';

class basket_screen extends StatefulWidget {
  const basket_screen({super.key});

  @override
  State<basket_screen> createState() => _basket_screenState();
}

class _basket_screenState extends State<basket_screen> {
  List<one_category>? list;
  @override
  Widget build(BuildContext context) {
    var cubit = app_cubit.get(context);
    String selectedName = '';
    var catego = one_categories();

    return BlocProvider(
        create: (BuildContext context) => app_cubit(),
        child: BlocConsumer<app_cubit, app_states>(
            listener: (BuildContext context, app_states state) {},
            builder: (BuildContext context, app_states state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('test'),
                ),
                body: Center(
                  child: Column(
                    children: [
                      Container(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedName =
                                      list?[0].category?.image ?? 'a';
                                  print(selectedName);
                                });
                              },
                              child: Text(selectedName))),
                    ],
                  ),
                ),
              );
            }));
  }

  one_categories() async {
    final jsonText =
        await rootBundle.loadString('assets/json/one_category.json');
    final x = List<one_category>.from(
        json.decode(jsonText).map((e) => one_category.fromJson(e))).toList();
    list = x;
    return list;
  }
}
