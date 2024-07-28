import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
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
    backgroundColor: HexColor("1D2733"),
    actionsIconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.purple),
  ),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: Colors.purpleAccent,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      )),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    actionsIconTheme: IconThemeData(
      color: Colors.grey,
    ),
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23.0,
        color: Colors.purpleAccent),
  ),
);
