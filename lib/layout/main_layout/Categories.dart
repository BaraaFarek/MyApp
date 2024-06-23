import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/main_layout/cubit/app_cubit.dart';
import 'package:untitled/layout/main_layout/cubit/app_states.dart';
import 'package:untitled/shared/components/constants/component.dart';

class Categories_screen extends StatelessWidget {
  Categories_screen({super.key});

  List<String> title = ['fashion', 'halls', 'cards', 'sallon', 'hello'];

// without Scaffold because home screen has a Scaffold
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => app_cubit(),
        child: BlocConsumer<app_cubit, app_states>(
            listener: (BuildContext context, app_states state) {},
            builder: (BuildContext context, app_states state) {
              return Scaffold(
                backgroundColor: Colors.white,
                body:ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Card( // استخدام Card لعرض كل صورة مع عنوانها
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.network(
                            images[index], // ضع عنوان الصورة هنا
                            fit: BoxFit.cover, // ضبط تناسب الصورة
                          ),
                          Padding(
                            padding: EdgeInsets.all(8), // تباعد حول النص
                            child: Text(
                              titles[index], // ضع العنوان هنا
                              style: TextStyle(fontSize: 16), // تغيير حجم الخط
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
              );
            }));
  }
}
// GestureDetector(
//                     child: Column(
//                   children: [
//                     SizedBox(
//                       height: 500,
//                       child: ListView.builder(
//                         physics: BouncingScrollPhysics(),
//                         itemCount: 5,
//                         itemBuilder: (context, index) => Container(
//                           height: 120,
//                           margin: EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 width: 220,
//                                 height: 120,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image:
//                                           AssetImage('assets/images/photo.png'),
//                                     )),
//                               ),
//                               Container(
//                                 width: 220.0,
//                                 height: 120,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.white.withOpacity(0.1),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     title[index],
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                       color: Colors.grey.shade100,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),