import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockStateNotifier extends StateNotifier<DateTime> {
  ClockStateNotifier() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }

  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
