import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/local/cache_Helper.dart';
import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/layout/main_layout/Home_Screen.dart';
import 'package:untitled/layout/main_layout/basket.dart';
import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/modules/login/login_screen.dart';

import 'shared/components/constants/Listview_Loading.dart';

void main() async {
  // بيتأكد انه كل شي في الميثود خلصت وبعدين يفتح التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  // bool isdark = CacheHelper.getData(key: 'isdark') as bool;
  bool isdark = false;
  runApp(MyApp(isdark));
}

class MyApp extends StatelessWidget {
  final bool isdark;

  MyApp(
    this.isdark,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => app_cubit()
        ..changeMode(
            // fromshared: isdark,
            ),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = app_cubit.get(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  //   selectedIconTheme: IconThemeData(
                  //     color: Colors.purpleAccent,
                  //   ),
                  //   unselectedIconTheme: IconThemeData(
                  //     color: Colors.grey,
                  //   ),
                  //   unselectedLabelStyle: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  //   type: BottomNavigationBarType.fixed,
                  // ),
                  appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(
                      color: Colors.black,
                    ),
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
                  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  //     type: BottomNavigationBarType.fixed,
                  //     selectedIconTheme: IconThemeData(
                  //       color: Colors.purpleAccent,
                  //     ),
                  //     unselectedIconTheme: IconThemeData(
                  //       color: Colors.white70,
                  //     ),
                  //     unselectedLabelStyle: TextStyle(
                  //       color: Colors.white,
                  //     )),
                  appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.white),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        color: Colors.white),
                  )),
              themeMode: app_cubit.get(context).isdark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: login_screen());
        },
      ),
    );
  }
//login_screen
}
