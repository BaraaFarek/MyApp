import 'package:flutter/material.dart';

class TestScreen1 extends StatelessWidget {
  const TestScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oeschines Lack Compground',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Mariam yhiaa Alaswad',
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        Text('41'),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.phone),
                    Text('Call'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.send),
                    Text('send'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share),
                    Text('share'),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                'Oeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack CompgroundOeschines Lack Compground'),
          ),
        ],
      )),
    );
  }
}
