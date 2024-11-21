import 'dart:async';

import 'package:app/features/pomodoro/pomodoro_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pomodoro_controller.g.dart';

@riverpod
class PomodoroController extends _$PomodoroController {
  Timer? _countTimer;
  Timer? _completeTimer;

  @override
  PomodoroState build() {
    ref.onDispose(() {
      _countTimer?.cancel();
      _completeTimer?.cancel();
    });

    return PomodoroState(
      remainingSeconds: PomodoroStatus.rest.duration,
      status: PomodoroStatus.rest,
    );
  }

  void rest() {
    state = state.copyWith(
      remainingSeconds: PomodoroStatus.rest.duration,
      status: PomodoroStatus.rest,
    );

    _countTimer?.cancel();
    _completeTimer?.cancel();
  }

  void start() {
    state = state.copyWith(
      remainingSeconds: PomodoroStatus.work.duration,
      status: PomodoroStatus.work,
    );

    _countTimer?.cancel();
    _completeTimer?.cancel();

    _completeTimer = Timer(
      Duration(seconds: state.remainingSeconds),
      onWorkComplete,
    );
    _countTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
    });
  }

  void onWorkComplete() {
    state = state.copyWith(
      remainingSeconds: PomodoroStatus.shortBreak.duration,
      status: PomodoroStatus.shortBreak,
    );

    _countTimer?.cancel();
    _completeTimer?.cancel();

    _completeTimer = Timer(
      Duration(seconds: state.remainingSeconds),
      start,
    );
    _countTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
    });
  }
}
