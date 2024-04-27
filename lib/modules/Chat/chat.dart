// import 'package:flutter/material.dart';
//
// class chat_Screen extends StatelessWidget {
//   const chat_Screen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('chat/.. ').snapshot(),
//         itemcount: snapshot.data,
//         builder : (context, snapshot) { ListView.builder(
//           itemCount: 10,
//             itemBuilder: (context, index) => Container(
//               padding: EdgeInsets.all(8),
//               child: Text('this work'),
//             )),}
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.message_outlined),
//         onPressed: (){
//           // // instance of qurey snapshot
//           // live listener
//           // FirebaseFirestore.instance.collection('chat/.. ').snapshot().listen(event){
//           //   // print(event.docs[0]['text']);
//           //   // or
//           //   // event.docs.forEach((element){
//           //   // print(element['text']);
//           //   // }
//           // };
//         },
//       ),
//     );
//   }
// }
