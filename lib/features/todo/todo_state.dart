import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodoState with _$TodoState {
  factory TodoState({
    required String id,
    required String title,
    required TodoStatus status,
  }) = _ToDoState;
}

enum TodoStatus {
  todo,
  doing,
  done;

  String get label => switch (this) {
        TodoStatus.todo => 'TODO',
        TodoStatus.doing => 'DOING',
        TodoStatus.done => 'DONE',
      };
}
