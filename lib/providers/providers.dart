import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'increment_counter.dart';

final numberProvider = Provider<int>((ref) {
  return 10;
});

final numberStateProvider = StateProvider<int>((ref) {
  return 20;
});

final numberFutureProvider = FutureProvider<int?>(
  (ref) {
    return Future.delayed(const Duration(seconds: 3), () {
      return Future.value(null);
    });
  },
);

final incrementCounterStateNotifierProvider = StateNotifierProvider(
  (ref) {
    return IncrementCounter();
  },
);
