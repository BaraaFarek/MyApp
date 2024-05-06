import 'package:flutter/material.dart';

class Categories_screen extends StatelessWidget {
  Categories_screen({super.key});

  // final category_model category ;
  List<String> imagePaths = [
    'download1.jpg',
    'download.jpg',
    'download2.jpg',
  ];
  List<String> title = ['fashion', 'halls', 'cards'];

// without Scaffold because home screen has a Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          child: Column(
        children: [
          Row(),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: 5, // عدد العناصر التي ترغب في عرضها
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person), // العنصر الأول في كل سطر
                  title: Text('Item $index'), // العنصر الثاني في كل سطر
                  onTap: () {
                    // إضافة أي تفاصيل إضافية هنا
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
// ListView.builder(
//               physics: BouncingScrollPhysics(),
//               itemCount: 3,
//               itemBuilder: (context, index) => Container(
//                 width: double.infinity,
//                 height: 200,
//                 margin: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(25)),
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 200,
//                       child: Image.asset(
//                         'assets/images/${imagePaths[index]}',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       height: 44,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.black.withOpacity(0.4),
//                       ),
//                       child: Center(
//                         child: Text(
//                           title[index],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                             color: Colors.grey.shade100,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
