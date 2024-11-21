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
    state = [
      ...state,
      TestState(
        id: ref.read(uuidProvider).v4(),
        title: s,
        status: TestStatus.todo,
      ),
    ];
  }

  void remove(TestState first) {}
}
