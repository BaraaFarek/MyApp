import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/layout/main_layout/Home_Screen.dart';
import 'package:untitled/layout/main_layout/basket.dart';

import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/modules/login/login_screen.dart';

import 'package:untitled/test_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => app_cubit(),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.blueAccent,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                  ),
                  appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    elevation: 0.0,
                    // backwardsCompatibility :false,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        color: Colors.purpleAccent),
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  )),
              // dark mode
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.grey,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.grey,
                      selectedIconTheme: IconThemeData(
                        color: Colors.purpleAccent,
                      ),
                      unselectedIconTheme: IconThemeData(
                        color: Colors.white70,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: Colors.white,
                      )),
                  appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: Colors.grey,
                    elevation: 0.0,
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        color: Colors.white),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark),
                  )),
              themeMode: app_cubit.get(context).isdark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: home1());
        },
      ),
    );
  }
//home_screen
//Bmi_screen
//Home
//login_screen
}
