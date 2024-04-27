import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/counter_with_bloc/Counter_states.dart';

import 'cubit.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

// counter screen with bloc package

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Counter_cubit(),
      // Bloc consumer let me to listen to changes
      child: BlocConsumer<Counter_cubit, counter_states>(
        listener: (context, state) {
          if (state is Counter_initial_state) print('initial state ');
          if (state is Counter_minus_state)
            print('minus state ${state.counter}');
          if (state is Counter_plus_state) print('plus state ${state.counter}');
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('hello '),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Counter_cubit.get(context).minus();
                      },
                      child: Text(
                        'minus',
                        style: TextStyle(fontSize: 20.0),
                      )),
                  Text(
                    '${Counter_cubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Counter_cubit.get(context).plus();
                      },
                      child: Text(
                        'plus',
                        style: TextStyle(fontSize: 20.0),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
