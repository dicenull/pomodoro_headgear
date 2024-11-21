import 'package:app/features/test_list/test_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_list_controller.g.dart';

@riverpod
class TestListController extends _$TestListController {
  @override
  List<TestState> build() {
    return [];
  }

  void add(String s) {}
}
