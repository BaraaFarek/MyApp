import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/layout/main_layout/app_cubit/app_states.dart';
import 'package:untitled/models/CategoriesModel.dart';
import 'StoresByCategory.dart';
import 'app_cubit/app_cubit.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var bloc = app_cubit()..fetchCategories();

  @override
  void initState() {
    super.initState();
    bloc.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<app_cubit, app_states>(
        listener: (BuildContext context, app_states state) {},
        builder: (BuildContext context, app_states state) {
          final appCubit = context.read<app_cubit>();
          final isDark = appCubit.isdark;

          return Scaffold(
            backgroundColor: isDark ? HexColor("17212B") : Colors.white,
            appBar: AppBar(
              backgroundColor: isDark ? HexColor("17212B") : Colors.white,
              iconTheme:
                  IconThemeData(color: isDark ? Colors.white : Colors.black),
              title: Text(
                'Categories',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
            ),
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
                          if (state is loadingCategoriesState)
                            Center(
                              child: SpinKitThreeBounce(
                                color: Colors.purpleAccent,
                                size: 20.0,
                              ),
                            ),
                          if (state is successCategoriessState)
                            Container(
                              height: 500,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 3 / 4,
                                ),
                                itemCount: state.categories.length,
                                itemBuilder: (context, index) {
                                  final salat = state.categories[index];

                                  return Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? HexColor("1C1C1C")
                                          : Colors.white,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                StoresByCategory(
                                              categoryId: salat.id,
                                            ),
                                          ),
                                        );
                                        appCubit.fetchCategories();
                                      },
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              salat.image,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                salat.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
