import 'package:app/features/pomodoro/pomodoro_controller.dart';
import 'package:app/features/pomodoro/pomodoro_state.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../create_container_test.dart';

void main() {
  test('初期化時は、ポモドーロ状態が待機状態になる', () {
    final container = createContainer();
    final subsc = container.listen(pomodoroControllerProvider, (_, __) {});

    expect(
      subsc.read().status,
      PomodoroStatus.rest,
    );
  });

  test('ポモドーロを開始すると、作業中状態になる', () {
    final container = createContainer();
    final subsc = container.listen(pomodoroControllerProvider, (_, __) {});

    container.read(pomodoroControllerProvider.notifier).start();

    expect(
      subsc.read().status,
      PomodoroStatus.work,
    );
  });

  test('作業中から25分後に、ポモドーロが完了する', () {
    fakeAsync((clock) {
      final container = createContainer();
      final subsc = container.listen(pomodoroControllerProvider, (_, __) {});

      final controller = container.read(pomodoroControllerProvider.notifier);

      controller.start();
      clock.elapse(const Duration(minutes: 25, seconds: 1));

      expect(subsc.read().status, PomodoroStatus.shortBreak);
    });
  });
}
