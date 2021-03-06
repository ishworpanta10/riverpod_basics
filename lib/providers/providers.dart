import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/user.dart';
import 'package:riverpod_demo/providers/clock_state_notifier.dart';
import 'package:riverpod_demo/services/fake_services.dart';

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

// clock state notifier
final clockStateNotifierProvider = StateNotifierProvider<ClockStateNotifier, DateTime>((ref) {
  return ClockStateNotifier();
});

//family provider with future
final futureProviderWithFamily = FutureProvider.family<User?, String>((ref, username) async {
  return FakeService.fetchUserData(username: username);
});
