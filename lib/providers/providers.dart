import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'increment_change_notifier_providers.dart';
import 'increment_state_notifer_counter.dart';

final numberProvider = Provider<int>((ref) {
  return 10;
});

final numberStateProvider = StateProvider<int>((ref) {
  return 20;
});

final numberFutureProvider = FutureProvider<int>(
  (ref) {
    return Future.delayed(const Duration(seconds: 3), () {
      return Future.value(0);
    });
  },
);

final numberStreamProvider = StreamProvider<int>(
  (ref) {
    return Stream.periodic(const Duration(seconds: 3), (_) {
      return 10;
    });
  },
);

final incrementCounterStateNotifierProvider = StateNotifierProvider(
  (ref) {
    return IncrementCounterStateProvider();
  },
);

final incrementCounterChangeNotifierProvider = ChangeNotifierProvider<IncrementCounterNotifierProvider>(
  (ref) {
    return IncrementCounterNotifierProvider();
  },
);
