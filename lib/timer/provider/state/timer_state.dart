import 'package:freezed_annotation/freezed_annotation.dart';

import 'timer_status.dart';

part 'timer_state.freezed.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState(
      {required int duration, required TimerStatus status}) = _TimerState;
}
