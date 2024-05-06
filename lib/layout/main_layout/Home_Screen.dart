import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/remote/DioHelper.dart';
import 'package:untitled/layout/main_layout/Account.dart';
import 'package:untitled/layout/main_layout/basket.dart';
import 'package:untitled/layout/main_layout/messenger1.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/layout/main_layout/delivery_screen.dart';
import 'package:untitled/layout/main_layout/categories.dart';

import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';

class home1 extends StatelessWidget {
  home1({super.key});

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => app_cubit(),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (BuildContext context, app_states state) {},
        builder: (BuildContext context, app_states state) {
          var cubit = app_cubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                backgroundColor: cubit.isdark ? Colors.grey[500] : Colors.white,
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: cubit.isdark ? Colors.white : Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        app_cubit.get(context).changeMode();
                      },
                      icon: Icon(
                        cubit.isdark ? Icons.sunny : Icons.brightness_3_sharp,
                        color: cubit.isdark ? Colors.white : Colors.black,
                      )),
                ],
                title: Text(
                  ' Ballon',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32.0,
                    fontFamily: 'ITCKRIST.TTF',
                    color: cubit.isdark ? Colors.white : Colors.purpleAccent,
                  ),
                ),
              ),
              body: cubit.screens[cubit.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
                backgroundColor: cubit.isdark ? Colors.grey : Colors.white,
                // fixed  لما بنكبس على وحدة ما بتغير الباقي
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                selectedItemColor: Colors.purple,
                unselectedItemColor: cubit.isdark ? Colors.white : Colors.grey,
                showUnselectedLabels: false,
                currentIndex: cubit.currentindex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
