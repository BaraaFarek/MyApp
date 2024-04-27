import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:untitled/category_model.dart';
import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';

class sala_Screen extends StatelessWidget {
  const sala_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = app_cubit.get(context);

    return BlocProvider(
        create: (BuildContext context) => app_cubit(),
        child: BlocConsumer<app_cubit, app_states>(
            listener: (BuildContext context, app_states state) {},
            builder: (BuildContext context, app_states state) {
              return SafeArea(
                  child: Scaffold(
                      appBar: AppBar(
                        title: Text('salat'),
                        backgroundColor: Colors.blue,
                      ),
                      body: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 30.0, right: 30.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 180,
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/Screenshot.png'),
                                        ),
                                      ),
                                    ),
                                    // Text('${cubit.getCategories()}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )));
            }));
  }
}
