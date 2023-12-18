import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  void increment() {
    emit(state + 1);
  }

  int getCounterValue() {
    return state;
  }
}
