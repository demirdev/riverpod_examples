import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/timer/provider/timer_provider.dart';

import '../provider/state/timer_status.dart';

class TimerActions extends ConsumerWidget {
  const TimerActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerProvider.select((value) => value.status));
    final timer = ref.read(timerProvider);
    final timerNotifier = ref.read(timerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (state == TimerStatus.initial) ...[
            FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => timerNotifier.start(timer.duration))
          ],
          if (state == TimerStatus.running) ...[
            FloatingActionButton(
                child: Icon(Icons.pause), onPressed: () => timerNotifier.stop())
          ],
          if (state == TimerStatus.paused) ...[
            FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => timerNotifier.resume())
          ],
          if (state == TimerStatus.completed) ...[
            FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => timerNotifier.reset())
          ],
        ],
      ),
    );
  }
}
