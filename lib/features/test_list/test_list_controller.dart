import 'package:app/features/identifier/identifier_provider.dart';
import 'package:app/features/test_list/test_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_list_controller.g.dart';

@riverpod
class TestListController extends _$TestListController {
  @override
  List<TestState> build() {
    return [];
  }

  void add(String s) {
    if (s.trim().isEmpty) {
      return;
    }

    state = [
      ...state,
      TestState(
        id: ref.read(uuidProvider).v4(),
        title: s,
        status: TestStatus.todo,
      ),
    ];
  }

  void remove(TestState item) {
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
        if (item.id == id) item.copyWith(status: TestStatus.doing) else item,
    ];
  }

  void doneFrom(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(status: TestStatus.done) else item,
    ];
  }

  void todoFrom(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(status: TestStatus.todo) else item,
    ];
  }
}
