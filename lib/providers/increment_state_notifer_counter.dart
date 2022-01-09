import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncrementCounterStateProvider extends StateNotifier<int> {
  IncrementCounterStateProvider() : super(0);

  void changeState(int number) {
    state = number;
  }
}
