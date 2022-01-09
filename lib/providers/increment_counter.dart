import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncrementCounter extends StateNotifier<int> {
  IncrementCounter() : super(0);

  void changeState(int number) {
    state = number;
  }
}
