abstract class counter_states {}

class Counter_initial_state extends counter_states {}

class Counter_minus_state extends counter_states {
  final int counter;
  Counter_minus_state(this.counter);
}

class Counter_plus_state extends counter_states {
  final int counter;

  Counter_plus_state(this.counter);
}
