import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    debugPrint('Created Provider: ${provider.name ?? provider.runtimeType}');
    debugPrint('Created Provider Value: $value');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    super.didDisposeProvider(provider, containers);
    debugPrint('Disposed Provider: ${provider.name}');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    debugPrint('Updated Provider: ${provider.name ?? provider.runtimeType}');
    debugPrint('Provider Prev Value: $previousValue');
    debugPrint('Provider New Value: $newValue');
  }

//   @override
//   void didUpdateProvider(
//     ProviderBase provider,
//     Object? previousValue,
//     Object? newValue,
//     ProviderContainer container,
//   ) {
//     print('''
// {
//   "provider": "${provider.name ?? provider.runtimeType}",
//   "newValue": "$newValue"
// }''');
//   }
}
