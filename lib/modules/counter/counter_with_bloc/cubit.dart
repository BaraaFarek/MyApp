import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/counter_with_bloc/Counter_states.dart';

// enter logic to your app inside bloc
class Counter_cubit extends Cubit<counter_states> {
  Counter_cubit() : super(Counter_initial_state());
  // create cubit
  static Counter_cubit get(context) => BlocProvider.of(context);
  int counter = 1;
  void minus() {
    counter--;
    emit(Counter_minus_state(counter));
  }

  void plus() {
    counter++;
    emit(Counter_plus_state(counter));
  }
}
