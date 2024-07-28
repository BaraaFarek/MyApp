// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled/layout/main_layout/app_cubit/app_cubit.dart';
// import 'package:untitled/layout/main_layout/app_cubit/app_states.dart';
//
// class MyCustomUI extends StatefulWidget {
//   @override
//   _MyCustomUIState createState() => _MyCustomUIState();
// }
//
// class _MyCustomUIState extends State<MyCustomUI>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   late Animation<double> _animation2;
//   List<String> title = ['fashion', 'halls', 'cards', 'sallon', 'hello'];
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//
//     _animation = Tween<double>(begin: 0, end: 1)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
//       ..addListener(() {
//         setState(() {});
//       });
//
//     _animation2 = Tween<double>(begin: -30, end: 0)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     app_cubit cubit = app_cubit.get(context);
//     double _w = MediaQuery.of(context).size.width;
//     return BlocProvider(
//       create: (BuildContext context) => app_cubit(),
//       child: BlocConsumer<app_cubit, app_states>(
//         listener: (BuildContext context, app_states state) {},
//         builder: (BuildContext context, app_states state) {
//           return Scaffold(
//               body: Stack(
//             children: [
//               // background color
//
//               /// ListView
//               ListView(
//                 physics: BouncingScrollPhysics(
//                     parent: AlwaysScrollableScrollPhysics()),
//                 children: [
//                   groupOfCards(
//                     title1: 'hello',
//                     image1: "assets/images/photo.png",
//                     title2: 'hello',
//                     image2: "assets/images/photo.png",
//                   ),
//                   groupOfCards(
//                     title1: 'hello',
//                     image1: "assets/images/photo.png",
//                     title2: 'hello',
//                     image2: "assets/images/photo.png",
//                   ),
//                   groupOfCards(
//                     title1: 'hello',
//                     image1: "assets/images/photo.png",
//                     title2: 'hello',
//                     image2: "assets/images/photo.png",
//                   )
//                 ],
//               ),
//
//               // ListView.builder(
//               //   physics: BouncingScrollPhysics(),
//               //   itemCount: 5,
//               //   itemBuilder: (context, index) => Container(
//               //     height: 120,
//               //     margin: EdgeInsets.all(20),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(20),
//               //     ),
//               //     child: Stack(
//               //       alignment: Alignment.center,
//               //       children: [
//               //         Container(
//               //           width: 220,
//               //           height: 120,
//               //           decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(20),
//               //               image: DecorationImage(
//               //                 fit: BoxFit.cover,
//               //                 image: AssetImage('assets/images/photo.png'),
//               //               )),
//               //         ),
//               //         Container(
//               //           width: 220.0,
//               //           height: 120,
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(20),
//               //             color: Colors.white.withOpacity(0.1),
//               //           ),
//               //           child: Center(
//               //             child: Text(
//               //               title[index],
//               //               style: TextStyle(
//               //                 fontWeight: FontWeight.bold,
//               //                 fontSize: 20,
//               //                 color: Colors.grey.shade100,
//               //               ),
//               //             ),
//               //           ),
//               //         )
//               //       ],
//               //     ),
//               //   ),
//               // ),
//
//               // /// AppBar
//               // bottomAppBar(),
//             ],
//           ));
//         },
//       ),
//     );
//   }
//
//   Widget groupOfCards(
//       {required String title1,
//       required String image1,
//       required String title2,
//       required String image2}) {
//     double _w = MediaQuery.of(context).size.width;
//     return Opacity(
//       opacity: _animation.value,
//       child: Transform.translate(
//         offset: Offset(0, _animation2.value),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             card(
//               title: title1,
//               image: "assets/images/photo.png",
//             ),
//             card(
//               title: title2,
//               image: "assets/images/photo.png",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class card extends StatelessWidget {
//   final String title;
//   final String image;
//
//   const card({
//     required this.title,
//     required this.image,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.white.withOpacity(.15)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Stack(children: [
//             Container(
//               width: 150,
//               height: 100,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.white.withOpacity(.2),
//               ),
//               child: Image.asset('assets/images/photo.png'),
//             ),
//             Container(
//               width: 150,
//               height: 100,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.white.withOpacity(.2),
//               ),
//               child: Text('name'),
//             ),
//           ]),
//         ],
//       ),
//     );
//   }
// }
