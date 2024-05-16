import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/shared/components/constants/component.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<app_cubit, app_states>(
        listener: (BuildContext context, app_states state) {},
        builder: (BuildContext context, app_states state) {
          app_cubit cubit = app_cubit.get(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: cubit.isdark ? Colors.grey[500] : Colors.white,
              elevation: 0.0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
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
                'Ballon',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0,
                  fontFamily: 'ITCKRIST.TTF',
                  color: cubit.isdark ? Colors.white : Colors.purpleAccent,
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        prefixIcon: Icon(Icons.search),
                        label: Text(' Search...')),
                  ),
                ),
                // Expanded(child: buildCategoryItem()),
              ],
            ),
          );
        },
      ),
    );
  }
}
