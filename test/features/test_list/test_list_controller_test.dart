import 'package:app/features/test_list/test_list_controller.dart';
import 'package:app/features/test_list/test_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../create_container_test.dart';

void main() {
  (ProviderSubscription<List<TestState>>, TestListController) buildSut() {
    final container = createContainer();
    final subsc = container.listen(testListControllerProvider, (_, __) {});
    final controller = container.read(testListControllerProvider.notifier);

    return (subsc, controller);
  }

  test('テストを追加できる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    expect(subsc.read().length, 1);
    expect(subsc.read().first.title, '足し算ができる');
    expect(subsc.read().first.status, TestStatus.todo);
  });
}
