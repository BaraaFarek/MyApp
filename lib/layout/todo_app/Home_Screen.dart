// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:untitled/layout/todo_app/tasks_screen.dart';
// import '../../shared/components/constants/TextFormField.dart';
// import 'archived_Screen.dart';
// import 'done_screen.dart';
//
// // 1. create database and create tables
// // 2. open database
// // 3. insert to database
// // 4. get from database
// // 5. update in database
// // 6. delete from database
//
// class home_screen extends StatefulWidget {
//   const home_screen({super.key});
//
//   @override
//   State<home_screen> createState() => _home_screenState();
// }
//
// // async this mean open thread to this method
// // await wait it to return results
//
// class _home_screenState extends State<home_screen> {
//   int currentindex = 0;
//   List<Widget> screens = [
//     const Tasks_screen(),
//     const done_screen(),
//     const archived_screen(),
//   ];
//   late Database database;
//   bool isshow = false;
//   IconData fab = Icons.edit;
//   var titleController = TextEditingController();
//   var timeController = TextEditingController();
//   var dateController = TextEditingController();
//   var stateController = TextEditingController();
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   var form_Key = GlobalKey<FormState>();
//   List<String> titles = ['Tasks', 'done', 'archived'];
//   @override
//   void initState() {
//     super.initState();
//     createDatabase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           backgroundColor: Colors.lightBlue,
//           title: Text(
//             titles[currentindex],
//             style: TextStyle(
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             // var name = await getName();
//             // print(name);
//
//             // insertTodatabse();
//             if (isshow) {
//               Navigator.pop(context);
//               isshow = false;
//               setState(() {
//                 fab = Icons.edit;
//               });
//             } else {
//               scaffoldKey.currentState!
//                   .showBottomSheet((context) => SingleChildScrollView(
//                         child: Container(
//                           color: Colors.grey[200],
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Column(
//                               // make the column locate in end of page
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 DefaultTextFormField(
//                                   control: titleController,
//                                   type: TextInputType.text,
//                                   // validate: (value) {
//                                   //   if (value.isEmpty) {
//                                   //     return ' title must not be empty';
//                                   //   }
//                                   // },
//                                   lab: 'task title',
//                                   obscure: false,
//                                   hint: 'hello my friend',
//                                   prefix: Icons.title,
//                                   suffix: null,
//                                   ontap: () {
//                                     print('timing tapped');
//                                   },
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 DefaultTextFormField(
//                                   control: timeController,
//                                   type: TextInputType.datetime,
//                                   // validate: (value) {
//                                   //   if (value.isEmpty) {
//                                   //     return ' title must not be empty';
//                                   //   }
//                                   // },
//                                   lab: 'task time ',
//                                   obscure: false,
//                                   hint: 'hello my friend',
//                                   prefix: Icons.watch_later_outlined,
//                                   suffix: null,
//                                   ontap: () {
//                                     showDatePicker(
//                                             lastDate:
//                                                 DateTime.parse('2021-05-03'),
//                                             context: context,
//                                             firstDate: DateTime.now(),
//                                             initialDate: DateTime.now())
//                                         .then((value) {
//                                       print(value.toString());
//                                     });
//                                     // showTimePicker(
//                                     //   context: context,
//                                     //   initialTime: TimeOfDay.now(),
//                                     // ).then((value) {
//                                     //   timeController.text =
//                                     //       value!.format(context).toString();
//                                     // });
//                                   },
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 DefaultTextFormField(
//                                   control: dateController,
//                                   type: TextInputType.datetime,
//                                   // validate: (value) {
//                                   //   if (value.isEmpty) {
//                                   //     return ' title must not be empty';
//                                   //   }
//                                   // },
//                                   lab: 'task date',
//                                   obscure: false,
//                                   hint: '',
//                                   prefix: Icons.date_range,
//                                   suffix: null,
//                                   ontap: () {
//                                     print('timing tapped');
//                                   },
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 DefaultTextFormField(
//                                   control: stateController,
//                                   type: TextInputType.text,
//                                   // validate: (value) {
//                                   //   if (value.isEmpty) {
//                                   //     return ' title must not be empty';
//                                   //   }
//                                   // },
//                                   lab: 'task status',
//                                   obscure: false,
//                                   hint: 'hello my friend',
//                                   prefix: Icons.real_estate_agent,
//                                   suffix: null,
//                                   ontap: () {
//                                     print('timing tapped');
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ));
//               isshow = true;
//               setState(() {
//                 fab = Icons.add;
//               });
//             }
//           },
//           child: Icon(fab),
//         ),
//         body: screens[currentindex],
//         bottomNavigationBar: BottomNavigationBar(
//           // fixed  لما بنكبس على وحدة ما بتغير الباقي
//           type: BottomNavigationBarType.fixed,
//           elevation: 50.0,
//           //make shadow above the bottom navigation bar
//           showSelectedLabels: true,
//           // showUnselectedLabels: false,
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.grey,
//           currentIndex: currentindex,
//           // the default bottom nav selected
//           onTap: (index) {
//             setState(() {
//               currentindex = index;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.check_circle_outline), label: 'Done'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.archive_outlined), label: 'Archived'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<String> getName() async {
//     // هييجي أن شاء الله معناتا بدو future
//     return 'baraa farek';
//   }
//
//   void createDatabase() async {
//     database = await openDatabase(
//       version: 1, // new database doesn't have versions
//       'todo.db',
//       // or :
//       // onCreate: (database, version) async {
//       //   print('database created');
//       //   await database.execute();
//       // },
//       //
//       onCreate: (database, version) {
//         // id integer , title String , date String , time String ,status String
//         print('database created');
//         // columnName  type it
//         database
//             .execute(
//                 'CREATE TABLE tasks( id INTEGER PRIMARY KEY ,title TEXT , date TEXT , time TEXT ,state TEXT)')
//             .then((value) {
//           print('table created');
//         }).catchError((error) {
//           print('Erroe when creating table${error.toString()}');
//         });
//       },
//       onOpen: (database) {
//         print('database opened');
//       },
//     );
//   }
//
//   void insertTodatabse() {
//     database.transaction((txn) {
//       txn
//           .rawInsert(
//               'INSERT INTO tasks (title,date,time,state) VALUES("first task ","02222","891","new" )')
//           .then((value) {
//         print('$value inserted successfully');
//       }).catchError((error) {
//         print(
//             'there is an error when inserting new record ${error.toString()}');
//       });
//       return Future(() => null);
//     });
//   }
// }
//
// // the operations consists from  two type :
// // first: the operation take a time fetch data from database
// //second :the operation don't take a time  like tap on bottun
// // which you go out from application
