import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';

class StoresByCategory extends StatelessWidget {
  final int categoryId;

  StoresByCategory({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => app_cubit()..fetchStoresByCategory(categoryId),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = context.read<app_cubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  appCubit.isdark ? HexColor("17212B") : Colors.white,
              elevation: 0.0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.bell,
                    size: 20,
                  ),
                  color: appCubit.isdark ? Colors.white : Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                      onPressed: () {
                        app_cubit.get(context).changeMode();
                      },
                      icon: Icon(
                        appCubit.isdark
                            ? Icons.sunny
                            : Icons.brightness_3_outlined,
                        color: appCubit.isdark ? Colors.white : Colors.black,
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
                          if (state is loadingStoresByCategoryState)
                            Center(child: CircularProgressIndicator()),
                          if (state is successStoresByCategoryState)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.stores.length,
                              itemBuilder: (context, index) {
                                final store = state.stores[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StoresByCategory(
                                                categoryId: store.categoryId,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10),
                                            ),
                                            child: Image.network(
                                              store.imageStore,
                                              width: double.infinity,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          store.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(store.address),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Phone: ${store.phone}'),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Text('Rating: ${store.rating}'),
                                          ),
                                          // if (store.rating == 1)
                                          //   Icon(Icons.star),
                                          // if (store.rating == 2)
                                          //   Row(children[
                                          //   Icon(Icons.star),
                                          //       Icon(Icons.star),
                                          //       ])
                                          // if (store.rating == 3)
                                          //   Row(
                                          //       children[
                                          //       Icon(Icons.star),
                                          //       Icon(Icons.star),
                                          //       Icon(Icons.star),
                                          //       ])
                                          //
                                          // if (store.rating == 2)
                                          //   Icon(Icons.star),
                                          // if (store.rating == 2)
                                          //   Icon(Icons.star),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          if (state is errorStoresByCategoryState)
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
