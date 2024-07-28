import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_states.dart';
import 'package:untitled/models/CategoriesModel.dart';

import 'StoresByCategory.dart';
import 'app_cubit/app_cubit.dart';
// Assuming you have a HexColor utility for color conversion

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  CategoriesModel? categoriesModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => app_cubit()..fetchCategories(),
      // ..getProducts(),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (BuildContext context, app_states state) {},
        builder: (BuildContext context, app_states state) {
          final appCubit = context.read<app_cubit>();
          return Scaffold(
            backgroundColor:
                appCubit.isdark ? HexColor("17212B") : Colors.white,
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          if (state is loadingCategoriesState)
                            Center(child: CircularProgressIndicator()),
                          if (state is successCategoriessState)
                            Container(
                              height: 500, // ضبط ارتفاع مناسب
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, // تغيير عدد الأعمدة إلى 3
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 3 / 4,
                                ),
                                itemCount: state.categories.length,
                                itemBuilder: (context, index) {
                                  final salat = state.categories[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: GestureDetector(
                                                onTap: () {
                                                  appCubit
                                                      .fetchStoresByCategory(
                                                          salat.id);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StoresByCategory(
                                                                  categoryId:
                                                                      salat
                                                                          .id)));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ClipRRect(
                                                          // borderRadius:
                                                          //     BorderRadius.vertical(
                                                          //         top: Radius
                                                          //             .circular(
                                                          //                 0)),
                                                          child: Image.network(
                                                            salat.image,
                                                            width:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ))),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            salat.name,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (state is errorCategoriesState)
                            Center(child: Text(state.error)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//  Container(
//                             width: double.infinity,
//                             height: 38,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(25.0),
//                             ),
//                             child: TextFormField(
//                               keyboardType: TextInputType.text,
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: appCubit.isdark
//                                     ? Colors.grey.withOpacity(0.9)
//                                     : Colors.white,
//                                 border: InputBorder.none,
//                                 label: Text(
//                                   'بحث',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black.withOpacity(0.5),
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(25),
//                                   borderSide: BorderSide(
//                                     width: 0.9,
//                                     color: Colors.purple,
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(25),
//                                   borderSide: BorderSide(
//                                     width: 0.01,
//                                     color: Colors.purple,
//                                   ),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(25),
//                                   borderSide: BorderSide(
//                                     width: 0.9,
//                                     color: Colors.redAccent,
//                                   ),
//                                 ),
//                                 prefixIcon: Icon(Icons.search_rounded),
//                               ),
//                             ),
//                           ),
