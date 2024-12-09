import 'package:app/features/pomodoro/pomodoro_controller.dart';
import 'package:app/features/pomodoro/pomodoro_state.dart';
import 'package:app/features/todo/todo_controller.dart';
import 'package:app/features/todo/todo_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'headgear_controller.g.dart';

@riverpod
void headgearController(Ref ref) {
  ref.listen(
      todoControllerProvider
          .select((v) => v.any((todo) => todo.status == TodoStatus.doing)),
      (_, isAnyDoing) {
    if (isAnyDoing) {
      ref.read(pomodoroControllerProvider.notifier).start();
    }
  });

  ref.listen(
      pomodoroControllerProvider.select((v) => v.status == PomodoroStatus.rest),
      (_, isRest) {
    if (isRest) {
      ref.read(todoControllerProvider.notifier).restAllDoingTodo();
    }
  });
}
