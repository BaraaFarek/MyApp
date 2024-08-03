// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// import 'StoresByCategory.dart';
// import 'app_cubit/app_cubit.dart';
// import 'app_cubit/app_states.dart';
//
// class StoresDetails extends StatefulWidget {
//   StoresDetails({super.key});
//
//   @override
//   State<StoresDetails> createState() => _StoresState();
// }
//
// class _StoresState extends State<StoresDetails> {
//   var bloc1 = app_cubit()..fetchStores();
//
//   @override
//   void initState() {
//     super.initState();
//     app_cubit()..fetchStores();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: bloc1,
//       child: BlocConsumer<app_cubit, app_states>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           final appCubit = context.read<app_cubit>();
//           return Scaffold(
//             backgroundColor:
//                 appCubit.isdark ? HexColor("17212B") : Colors.white,
//             body: Directionality(
//               textDirection: TextDirection.ltr,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     if (state is loadingStoresState)
//                       Center(
//                         child: SpinKitThreeBounce(
//                           color: Colors.purpleAccent,
//                           size: 20.0,
//                         ),
//                       ),
//                     if (state is successStoresState)
//                       Column(
//                         children: state.stores.map((store) {
//                           double ratingValue =
//                               double.tryParse(store.rating) ?? 0.0;
//                           return Column(
//                             children: [
//                               Image.network(
//                                 store.imageStore,
//                                 width: double.infinity,
//                                 height: 250,
//                                 fit: BoxFit.cover,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       store.name,
//                                       style: TextStyle(
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Row(
//                                       children: [
//                                         Icon(Icons.location_on_outlined,
//                                             size: 18),
//                                         SizedBox(width: 5),
//                                         Expanded(
//                                           child: Text(
//                                             store.address,
//                                             style: TextStyle(fontSize: 16),
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 8),
//                                     Row(
//                                       children: [
//                                         Icon(Icons.phone, size: 18),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           store.phone,
//                                           style: TextStyle(fontSize: 16),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 8),
//                                     Row(
//                                       children: [
//                                         Icon(FontAwesomeIcons.facebook,
//                                             size: 18),
//                                         SizedBox(width: 5),
//                                         Expanded(
//                                           child: Text(
//                                             store.facebookLink,
//                                             style: TextStyle(fontSize: 16),
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 8),
//                                     Row(
//                                       children: [
//                                         Icon(FontAwesomeIcons.instagram,
//                                             size: 18),
//                                         SizedBox(width: 5),
//                                         Expanded(
//                                           child: Text(
//                                             store.instagramLink,
//                                             style: TextStyle(fontSize: 16),
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 8),
//                                     RatingBarIndicator(
//                                       rating: ratingValue,
//                                       itemBuilder: (context, index) => Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                       ),
//                                       itemCount: 5,
//                                       itemSize: 24.0,
//                                       direction: Axis.horizontal,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     if (state is errorStoresState)
//                       Center(child: Text(state.error)),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
