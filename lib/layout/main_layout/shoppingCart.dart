import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_states.dart';

class basket_screen extends StatefulWidget {
  const basket_screen({super.key});

  @override
  State<basket_screen> createState() => _basket_screenState();
}

class _basket_screenState extends State<basket_screen> {
  @override
  Widget build(BuildContext context) {
    var cubit = app_cubit.get(context);
    return Scaffold();
    // return BlocProvider(
    //     create: (BuildContext context) => app_cubit(),
    //     child: BlocConsumer<app_cubit, app_states>(
    //         listener: (BuildContext context, app_states state) {},
    //         builder: (BuildContext context, app_states state) {
    //           return Scaffold(
    //             body: Center(child: Text('hello')),
    //           );
    //         }));
  }
}
