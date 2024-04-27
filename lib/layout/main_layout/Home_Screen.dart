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
              appBar: AppBar(
                elevation: 0.0,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        app_cubit.get(context).changeMode();
                      },
                      icon: Icon(Icons.brightness_4)),
                ],
                title: Text(
                  app_cubit
                      .get(context)
                      .titles[app_cubit.get(context).currentindex],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.purpleAccent,
                  ),
                ),
              ),
              body: cubit.screens[cubit.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
                // fixed  لما بنكبس على وحدة ما بتغير الباقي
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                selectedItemColor: Colors.purple,
                unselectedItemColor: Colors.grey,
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
