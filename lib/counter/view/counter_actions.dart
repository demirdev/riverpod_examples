import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/counter_provider.dart';

class CounterActions extends ConsumerWidget {
  const CounterActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterStateNotifier = ref.read(counterProvider.notifier);

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
          FloatingActionButton(
            onPressed: () {
              return counterStateNotifier.increment();
            },
            child: Text("+"),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => counterStateNotifier.decrement(),
            child: Text("-"),
          ),
        ],
      ),
    );
  }
}
