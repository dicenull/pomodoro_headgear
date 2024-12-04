import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_state.freezed.dart';

@freezed
abstract class TestState with _$TestState {
  factory TestState({
    required String id,
    required String title,
    required TestStatus status,
  }) = _TestState;
}

enum TestStatus {
  todo,
  doing,
  done;

  String get label => switch (this) {
        TestStatus.todo => 'TODO',
        TestStatus.doing => 'DOING',
        TestStatus.done => 'DONE',
      };
}
