import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_state.freezed.dart';

@freezed
class PomodoroState with _$PomodoroState {
  factory PomodoroState({
    Timer? timer,
    @Default(PomodoroStatus.rest) PomodoroStatus status,
  }) = _PomodoroState;
}

enum PomodoroStatus {
  rest,
  work,
  shortBreak,
}
