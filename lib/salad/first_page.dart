import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
   List<int> num= [
     1,
     2,
     3,
     1,
     2,
     3,
     1,
     2,
     3,
   ];
   List<Color> color=[
     Colors.green,
     Colors.blue,
     Colors.grey,
     Colors.green,
     Colors.blue,
     Colors.grey,
     Colors.green,
     Colors.blue,
     Colors.grey,
   ];
   List<String> tittel=[
     'green',
     'blue',
     'grey',
     'green',
     'blue',
     'grey',
     'green',
     'blue',
     'grey',
   ];
   List<IconData> icon=[
     Icons.account_balance_sharp,
     Icons.accessibility,
     Icons.accessible,
     Icons.account_balance_sharp,
     Icons.accessibility,
     Icons.accessible,
     Icons.account_balance_sharp,
     Icons.accessibility,
     Icons.accessible,
   ];

  FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          'First Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: const Icon(Icons.access_time_filled_outlined),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
       child:ListView.builder(
        itemCount: color.length,
           itemBuilder :( BuildContext context,int index) =>builditem()

       ),
      )






            // MaterialButton(
            //   onPressed: () {},
            //   child: Container(
            //     width: 150,
            //     height: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.lime,
            //       borderRadius: BorderRadius.circular(26),
            //     ),
            //     child: Center(
            //         child: Text(
            //           'click',
            //           style: TextStyle(
            //             fontSize: 30,
            //           ),
            //
            //         )),
            //   ),
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // ElevatedButton(onPressed:(){},
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.red,
            //   ),
            //   child:Text(
            //     'click',style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 20,
            //   ),
            //   ),
            //
            // )

    );
  }
  Widget builditem(){
    return Container(
      color: Colors.green,
      height: 100,
      child: const Row(
        children: [
          Text('2',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Text('green',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),

        ],
      ),
    );
  }
}
