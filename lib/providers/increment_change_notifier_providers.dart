import 'package:flutter/material.dart';

class IncrementCounterNotifierProvider extends ChangeNotifier {
  int _initialCount = 0;
  int get initialCount => _initialCount;

  void setCounter(int counter) {
    _initialCount = counter;
  }

  void incrementCounter() {
    _initialCount++;
    notifyListeners();
  }
}
