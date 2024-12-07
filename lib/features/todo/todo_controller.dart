import 'package:app/features/identifier/identifier_provider.dart';
import 'package:app/features/todo/todo_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  @override
  List<TodoState> build() {
    return [];
  }

  void add(String s) {
    if (s.trim().isEmpty) {
      return;
    }

    state = [
      ...state,
      TodoState(
        id: ref.read(uuidProvider).v4(),
        title: s,
        status: TodoStatus.todo,
      ),
    ];
  }

  void remove(TodoState item) {
    state = state.where((e) => e.id != item.id).toList();
  }

  void edit(String id, {required String title}) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(title: title) else item,
    ];
  }

  void doingFrom(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(status: TodoStatus.doing) else item,
    ];
  }

  void doneFrom(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(status: TodoStatus.done) else item,
    ];
  }

  void todoFrom(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(status: TodoStatus.todo) else item,
    ];
  }
}
