import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'StoresByCategory.dart';
import 'StoresDetails.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';

class StoresScreen extends StatefulWidget {
  StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresState();
}

class _StoresState extends State<StoresScreen> {
  var bloc1 = app_cubit()..fetchStores();
  @override
  void initState() {
    super.initState();
    app_cubit()..fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc1,
      child: BlocConsumer<app_cubit, app_states>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = context.read<app_cubit>();
          return Scaffold(
            backgroundColor:
                appCubit.isdark ? HexColor("17212B") : Colors.white,
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state is loadingStoresState)
                            Center(
                              child: SpinKitThreeBounce(
                                color: Colors.purpleAccent,
                                size: 20.0,
                              ),
                            ),
                          if (state is successStoresState)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.stores.length,
                              itemBuilder: (context, index) {
                                final store = state.stores[index];
                                double ratingValue =
                                    double.tryParse(store.rating) ?? 0.0;
                                return GestureDetector(
                                  // onTap: () async {
                                  //   await Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               StoresDetails()));
                                  //   appCubit.fetchCategories();
                                  // },
                                  child: Container(
                                    height: 100,
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              left: Radius.circular(10),
                                            ),
                                            child: Image.network(
                                              store.imageStore,
                                              width: double.infinity,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, left: 5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4.0),
                                                  child: Text(
                                                    store.name,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 18,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        store.address,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.phone,
                                                      size: 18,
                                                    ),
                                                    Text(' ${store.phone}'),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0, left: 5.0),
                                                  child: Row(
                                                    children: List.generate(
                                                      5, // Assuming a 5-star rating system
                                                      (index) {
                                                        if (index <
                                                            ratingValue
                                                                .floor()) {
                                                          return Icon(
                                                            Icons.star,
                                                            size: 12,
                                                            color: Colors.amber,
                                                          );
                                                        } else {
                                                          return Icon(
                                                            Icons.star_border,
                                                            size: 12,
                                                            color: Colors.amber,
                                                          );
                                                        }
                                                      },
                                                    ).toList(), // Convert Iterable<Icon> to List<Widget>
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (state is errorStoresState)
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
