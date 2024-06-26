import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  static const int maxCounter = 10;
  static const int minCounter = -10;

  void increment() {
    if (state < maxCounter) {
      emit(state + 1);
    }
  }

  void decrement() {
    if (state > minCounter) {
      emit(state - 1);
    }
  }

  void reset() => emit(0);
}
