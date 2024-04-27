import 'package:flutter/material.dart';

class CounterScreeb extends StatefulWidget {
  const CounterScreeb({super.key});

  @override
  State<CounterScreeb> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreeb> {
  int counter = 1;
  // 1. constructor
  //2. init state
  //3. build
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('-'),
                )),
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text('+')),
          ],
        ),
      ),
    );
  }
}
