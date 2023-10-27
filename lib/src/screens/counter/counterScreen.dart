// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/src/providers/counterProvider.dart';
import 'package:widgets_app/src/providers/themeProvider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
              onPressed: (){
                ref.read(themeProvider.notifier).state = !isDarkMode;
              }
            )
          ],
        ),
        body:  Center(
          child: Text('Value: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: const Icon(Icons.add),
        ));
  }
}
