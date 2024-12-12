import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_state.freezed.dart';

@freezed
class PomodoroState with _$PomodoroState {
  factory PomodoroState({
    required int remainingSeconds,
    required PomodoroStatus status,
  }) = _PomodoroState;

  const PomodoroState._();

  String get time {
    final sign = remainingSeconds < 0 ? '-' : '';
    final v = remainingSeconds.abs();
    final m = (v ~/ 60).toString().padLeft(2, '0');
    final s = (v % 60).toString().padLeft(2, '0');
    return '$sign$m:$s';
  }
}

enum PomodoroStatus {
  rest,
  work,
  shortBreak;

  String get label => switch (this) {
        PomodoroStatus.rest => 'お休み',
        PomodoroStatus.work => '作業',
        PomodoroStatus.shortBreak => '小休憩',
      };

  int get duration => switch (this) {
        PomodoroStatus.rest => 25 * 60,
        PomodoroStatus.work => 25 * 60,
        PomodoroStatus.shortBreak => 5 * 60,
      };
}
