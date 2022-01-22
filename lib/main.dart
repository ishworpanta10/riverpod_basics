import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_demo/providers/increment_change_notifier_providers.dart';
import 'package:riverpod_demo/providers/provider_observer.dart';
import 'package:riverpod_demo/providers/providers.dart';

import 'screens/new_demo_page.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('=======================Build Called============================');
    // final numberState = ref.watch(numberStateProvider);
    ref.listen<IncrementCounterNotifierProvider>(incrementCounterChangeNotifierProvider, (previous, next) {
      if (next.initialCount == 2) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Value is ${next.initialCount}")));
      }
    });

    //for timer
    // final currentDate = ref.watch(clockStateNotifierProvider);
    // final formattedTime = DateFormat.Hms().format(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        ///build method called every time when fab is pressed
        // child: Text("Number is ${ref.watch(numberStateProvider)}"),
        ///build method does not called every time when fab is pressed
        // child: Consumer(
        //   builder: (context, ref, child) {
        //     return Text("Number is ${ref.watch(numberStateProvider)}");
        //   },
        // ),
        ///future provider
        // child: ref.watch(numberFutureProvider).whenOrNull(
        //       data: (data) => Text('Data :$data'),
        //       error: (err, st) => Text('Error: $err, $st'),
        //       loading: () => const CircularProgressIndicator(),
        //     ),
        /// state notifier provider
        // child: Text(
        //   ref.watch(incrementCounterStateNotifierProvider).toString(),
        // ),

        /// change notifier provider
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(incrementCounterChangeNotifierProvider).initialCount.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            Consumer(
              builder: (context, refWatch, child) {
                final currentDate = refWatch.watch(clockStateNotifierProvider);
                final formattedTime = DateFormat.Hms().format(currentDate);
                return Text(
                  formattedTime,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewDemoPage(),
                  ),
                );
              },
              child: const Text('New Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(numberStateProvider.state).state++;
          // ref.refresh(numberFutureProvider);
          // ref.read<IncrementCounterStateProvider>(incrementCounterStateNotifierProvider.notifier).changeState(80);
          ref.read(incrementCounterChangeNotifierProvider).incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
