import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:untitled/layout/main_layout/app_cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_states.dart';

import '../../Network/local/cache_Helper.dart';
import '../../core/api_endpoints.dart';

class home1 extends StatefulWidget {
  home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  String? userName = CacheHelper.getData(key: 'name');

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<app_cubit, app_states>(
      listener: (BuildContext context, app_states state) {},
      builder: (BuildContext context, app_states state) {
        var Appcubit = app_cubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor:
                  Appcubit.isdark ? HexColor("17212B") : Colors.white,
              elevation: 0.0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.bell,
                    size: 20,
                  ),
                  color: Appcubit.isdark ? Colors.white : Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                      onPressed: () {
                        app_cubit.get(context).changeMode();
                      },
                      icon: Icon(
                        Appcubit.isdark
                            ? Icons.sunny
                            : Icons.brightness_3_outlined,
                        color: Appcubit.isdark ? Colors.white : Colors.black,
                      )),
                ),
              ],
              title: Text(
                ' Ballon',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  fontFamily: 'ITCKRIST.TTF',
                  color: Colors.purpleAccent,
                ),
              ),
            ),
            drawer: Drawer(
                child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                  ),
                  child: Text(
                    'Ballon',
                    style: TextStyle(
                      fontFamily: 'ITCKRIST.TTF',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_pin,
                    size: 32,
                  ),
                  title: Text('${userName}'),
                  onTap: () {
                    // Add functionality here
                  },
                ),
              ],
            )),
            body: Appcubit.screens[Appcubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              items: Appcubit.bottomItems,
              backgroundColor:
                  Appcubit.isdark ? HexColor("17212B") : Colors.white,
              // fixed  لما بنكبس على وحدة ما بتغير الباقي
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              selectedIconTheme: IconThemeData(color: Colors.purple),
              unselectedIconTheme: IconThemeData(
                color: Appcubit.isdark ? Colors.white : Colors.grey,
              ),
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              currentIndex: Appcubit.currentindex,
              onTap: (index) {
                Appcubit.changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
