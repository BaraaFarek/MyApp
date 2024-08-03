import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';

class StoresByCategory extends StatefulWidget {
  final int categoryId;

  StoresByCategory({required this.categoryId});

  @override
  State<StoresByCategory> createState() => _StoresByCategoryState();
}

class _StoresByCategoryState extends State<StoresByCategory> {
  List<Icon> ratingStars = [];
  String? rating;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          app_cubit()..fetchStoresByCategory(widget.categoryId),
      child: BlocConsumer<app_cubit, app_states>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = context.read<app_cubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  appCubit.isdark ? HexColor("17212B") : Colors.white,
              automaticallyImplyLeading: false,
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
                'Ballon',
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
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state is loadingStoresByCategoryState)
                            Center(
                              child: SpinKitThreeBounce(
                                color: Colors.purpleAccent,
                                size: 20.0,
                              ),
                            ),
                          if (state is successStoresByCategoryState)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.stores.length,
                              itemBuilder: (context, index) {
                                final store = state.stores[index];
                                double ratingValue =
                                    double.tryParse(store.rating) ?? 0.0;
                                return Container(
                                  height: 120,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
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
                                          width: 100,
                                          height: 150,
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
                                                padding: const EdgeInsets.only(
                                                    bottom: 4.0),
                                                child: Text(
                                                  store.name,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
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
                                                    Icons.location_on_outlined,
                                                    size: 18,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      store.address,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                  GestureDetector(
                                                      onTap: () {
                                                        launch(
                                                            "${store.phone}");
                                                      },
                                                      child: Text(
                                                          ' ${store.phone}')),
                                                ],
                                              ),
                                              Row(
                                                children: List.generate(
                                                  5,
                                                  (index) {
                                                    if (index <
                                                        ratingValue.floor()) {
                                                      return Icon(
                                                        Icons.star,
                                                        size: 12,
                                                        color: Colors.amber,
                                                      );
                                                    } else if (index <
                                                        ratingValue) {
                                                      return Icon(
                                                        Icons.star_half,
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
                                                ).toList(),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      launch(
                                                          "${store.facebookLink}");
                                                    },
                                                    icon: Icon(
                                                      Icons.facebook_outlined,
                                                      color: HexColor("1976D2"),
                                                      size: 20,
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        BoxConstraints(),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      launch(
                                                          "${store.instagramLink}");
                                                    },
                                                    icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .instagram,
                                                      color: Colors.pink,
                                                      size: 20,
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        BoxConstraints(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
