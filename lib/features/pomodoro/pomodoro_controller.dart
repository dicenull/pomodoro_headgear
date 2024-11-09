import 'dart:async';

import 'package:app/features/pomodoro/pomodoro_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pomodoro_controller.g.dart';

@riverpod
class PomodoroController extends _$PomodoroController {
  @override
  PomodoroState build() {
    return PomodoroState();
  }

  void start() {
    state = state.copyWith(
      status: PomodoroStatus.work,
      timer: Timer(const Duration(minutes: 25), onWorkComplete),
    );
  }

  void onWorkComplete() {
    state = state.copyWith(
      status: PomodoroStatus.shortBreak,
      timer: Timer(const Duration(minutes: 5), start),
    );
  }
}
