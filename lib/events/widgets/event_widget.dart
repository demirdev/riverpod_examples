import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/events_stream_provider.dart';

class EventWidget extends ConsumerWidget {
  const EventWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _events = ref.watch(eventsStreamProvider);

    return _events.when(
        data: (data) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Text('Received from websocket',
                    style: Theme.of(context).textTheme.caption),
                Spacer(),
                ElevatedButton(
                  onPressed: () => ref
                      .read(eventsChannelProvider)
                      .sink
                      .add('${Random().nextInt(1000)}'),
                  child: Text('Send Random Number'),
                ),
                Spacer(),
              ],
            ),
        error: (error, stack) => Text('error: $error'),
        loading: () => CircularProgressIndicator());
  }
}
