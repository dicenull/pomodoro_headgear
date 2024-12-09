import 'package:app/features/headgear/headgear_controller.dart';
import 'package:app/features/pomodoro/pomodoro_controller.dart';
import 'package:app/features/pomodoro/pomodoro_state.dart';
import 'package:app/features/todo/todo_controller.dart';
import 'package:app/features/todo/todo_state.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../create_container_test.dart';

void main() {
  group(headgearControllerProvider, () {
    ProviderContainer buildSut() {
      final container = createContainer();
      container.listen(headgearControllerProvider, (_, __) {});

      return container;
    }

    test('TODOを進行中にしたらポモドーロが開始される', () {
      final container = buildSut();
      final todoController = container.read(todoControllerProvider.notifier)
        ..add('足し算');
      final todo = container.read(todoControllerProvider).first;
      todoController.doingFrom(todo.id);

      expect(
        container.read(pomodoroControllerProvider).status,
        PomodoroStatus.work,
      );
    });

    test('休憩中以外にTODOを進行中にしても、ポモドーロは変化しない', () {
      fakeAsync((time) {
        final container = buildSut();
        final todoController = container.read(todoControllerProvider.notifier)
          ..add('足し算');
        final todo = container.read(todoControllerProvider).first;

        todoController.doingFrom(todo.id);
        time.elapse(const Duration(minutes: 10));
        todoController.todoFrom(todo.id);
        todoController.doingFrom(todo.id);

        expect(
          container.read(pomodoroControllerProvider).status,
          PomodoroStatus.work,
        );
        expect(container.read(pomodoroControllerProvider).time, '15:00');
      });
    });

    test('ポモドーロを休憩にすると、進行中のTODOがTODOに戻る', () {
      final container = buildSut();
      final todoController = container.read(todoControllerProvider.notifier)
        ..add('足し算')
        ..add('引き算');
      final todo = container.read(todoControllerProvider).first;
      final todo2 = container.read(todoControllerProvider).skip(1).first;
      todoController
        ..doingFrom(todo.id)
        ..doneFrom(todo2.id);

      container.read(pomodoroControllerProvider.notifier).rest();

      expect(
        container.read(todoControllerProvider).map((v) => v.status),
        [TodoStatus.todo, TodoStatus.done],
      );
    });
  });
}
