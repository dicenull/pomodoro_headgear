import 'package:app/features/pomodoro/pomodoro_controller.dart';
import 'package:app/features/pomodoro/pomodoro_state.dart';
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
}
