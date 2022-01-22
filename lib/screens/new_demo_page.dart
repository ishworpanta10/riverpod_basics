import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/user.dart';
import 'package:riverpod_demo/providers/providers.dart';

class NewDemoPage extends StatefulWidget {
  const NewDemoPage({Key? key}) : super(key: key);

  @override
  State<NewDemoPage> createState() => _NewDemoPageState();
}

class _NewDemoPageState extends State<NewDemoPage> {
  String username = userDropDownList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('River pod'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final future = ref.watch(futureProviderWithFamily(username));
                  return future.when(
                    data: (data) {
                      if (data == null) {
                        return const Text(
                          'user not found',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.username),
                          Text(data.address),
                          Text(data.age.toString()),
                        ],
                      );
                    },
                    error: (err, st) => Text(err.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 100),
              DropdownButton<String>(
                  value: username,
                  iconSize: 32,
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                  items: userDropDownList.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                  onChanged: (value) => setState(() => username = value ?? '')),
            ],
          ),
        ),
      ),
    );
  }
}
