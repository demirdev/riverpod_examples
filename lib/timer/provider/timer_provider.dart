import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/timer/data_source/ticker.dart';

import 'state/timer_state.dart';
import 'state/timer_status.dart';

const _defaultDurationInSeconds = 10;

class TimerStateNotifier extends StateNotifier<TimerState> {
  TimerStateNotifier([TimerState? state])
      : super(state ??
            TimerState(
                duration: _defaultDurationInSeconds,
                status: TimerStatus.initial));

  Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  start(int duration) {
    _tickerSubscription?.cancel();
    state = TimerState(duration: duration, status: TimerStatus.running);

    _tickerSubscription = _ticker.tick(ticks: duration).listen((_duration) {
      if (_duration == 0) {
        state = state.copyWith(duration: 0, status: TimerStatus.completed);
      } else {
        state = TimerState(duration: _duration, status: TimerStatus.running);
      }
    });
  }

  stop() {
    _tickerSubscription?.pause();
    state = state.copyWith(status: TimerStatus.paused);
  }

  resume() {
    _tickerSubscription?.resume();
    state = state.copyWith(status: TimerStatus.running);
  }

  reset() {
    _tickerSubscription?.cancel();
    state = state.copyWith(
        duration: _defaultDurationInSeconds, status: TimerStatus.initial);
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }
}

final timerProvider = StateNotifierProvider<TimerStateNotifier, TimerState>(
    (ref) => TimerStateNotifier());
