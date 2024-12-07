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
    expect(subsc.read().first.id, isNotEmpty);
  });

  test('テストを削除できる', () {
    final (subsc, controller) = buildSut();

    controller
      ..add('足し算ができる')
      ..add('引き算ができる');

    final removeItem = subsc.read().first;
    controller.remove(removeItem);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.title, '引き算ができる');
  });

  test('テストタイトルが編集できる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller.edit(editId, title: '掛け算ができる');

    expect(subsc.read().length, 1);
    expect(subsc.read().first.title, '掛け算ができる');
  });

  test('テストを進行中にできる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller.doingFrom(editId);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.status, TestStatus.doing);
  });

  test('テストを完了にできる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller
      ..doingFrom(editId)
      ..doneFrom(editId);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.status, TestStatus.done);
  });

  test('テストをTODOに戻せる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller
      ..doingFrom(editId)
      ..todoFrom(editId);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.status, TestStatus.todo);
  });

  test('空文字列ではテストを追加できない', () {
    final (subsc, controller) = buildSut();

    controller.add('');

    expect(subsc.read(), isEmpty);
  });
}
