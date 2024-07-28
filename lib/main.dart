import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/local/cache_Helper.dart';
import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_states.dart';
import 'package:untitled/shared/components/constants/themes.dart';
import 'core/api_endpoints.dart';
import 'layout/main_layout/Home_Screen.dart';
import 'modules/Login&Register/login_screen.dart';

void main() async {
  // بيتأكد انه كل الميثود خلصت وبعدين يفتح التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isdark = CacheHelper.getData(key: 'isdark');
  Widget widget;
  token = await CacheHelper.getData(key: 'token');
  if (token != null)
    widget = home1();
  else
    widget = Login_screen();

  runApp(BlocProvider(
      create: (context) => app_cubit(), child: MyApp(isdark!, widget)));
}
// color of appBar

class MyApp extends StatelessWidget {
  final bool isdark;
  final Widget StartWidget;

  MyApp(this.isdark, this.StartWidget);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<app_cubit, app_states>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: app_cubit.get(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Login_screen());
      },
    );
  }

//login_screen
}
