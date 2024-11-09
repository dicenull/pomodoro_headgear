import 'package:app/features/pomodoro/pomodoro_controller.dart';
import 'package:app/features/pomodoro/pomodoro_state.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../create_container_test.dart';

void main() {
  (ProviderSubscription<PomodoroState>, PomodoroController) buildSut() {
    final container = createContainer();
    final subsc = container.listen(pomodoroControllerProvider, (_, __) {});
    final controller = container.read(pomodoroControllerProvider.notifier);

    return (subsc, controller);
  }

  test('初期化時は、ポモドーロ状態が待機状態になる', () {
    final (subsc, _) = buildSut();

    expect(
      subsc.read().status,
      PomodoroStatus.rest,
    );
  });

  test('ポモドーロを開始すると、作業中状態になる', () {
    final (subsc, controller) = buildSut();

    controller.start();

    expect(
      subsc.read().status,
      PomodoroStatus.work,
    );
  });

  test('作業中から25分後に、ポモドーロが完了する', () {
    fakeAsync((clock) {
      final (subsc, controller) = buildSut();

      controller.start();
      clock.elapse(const Duration(minutes: 25));

      expect(subsc.read().status, PomodoroStatus.shortBreak);
    });
  });
}
