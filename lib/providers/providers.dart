import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = Provider<int>((ref) {
  return 10;
});

final numberStateProvider = StateProvider<int>((ref) {
  return 20;
});
