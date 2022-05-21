import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/timer/provider/timer_provider.dart';

class TimerText extends ConsumerWidget {
  const TimerText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(timerProvider.select((value) => value.duration));

    return Text(
      duration.toString(),
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
