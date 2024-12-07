import 'package:app/features/todo/todo_controller.dart';
import 'package:app/features/todo/todo_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../create_container_test.dart';

void main() {
  (ProviderSubscription<List<TodoState>>, TodoController) buildSut() {
    final container = createContainer();
    final subsc = container.listen(todoControllerProvider, (_, __) {});
    final controller = container.read(todoControllerProvider.notifier);

    return (subsc, controller);
  }

  test('TODOを追加できる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    expect(subsc.read().length, 1);
    expect(subsc.read().first.title, '足し算ができる');
    expect(subsc.read().first.status, TodoStatus.todo);
    expect(subsc.read().first.id, isNotEmpty);
  });

  test('TODOを削除できる', () {
    final (subsc, controller) = buildSut();

    controller
      ..add('足し算ができる')
      ..add('引き算ができる');

    final removeItem = subsc.read().first;
    controller.remove(removeItem);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.title, '引き算ができる');
  });

  test('TODOタイトルが編集できる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller.edit(editId, title: '掛け算ができる');

    expect(subsc.read().length, 1);
    expect(subsc.read().first.title, '掛け算ができる');
  });

  test('TODOを進行中にできる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller.doingFrom(editId);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.status, TodoStatus.doing);
  });

  test('TODOを完了にできる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller
      ..doingFrom(editId)
      ..doneFrom(editId);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.status, TodoStatus.done);
  });

  test('TODOをTODOに戻せる', () {
    final (subsc, controller) = buildSut();

    controller.add('足し算ができる');

    final editId = subsc.read().first.id;
    controller
      ..doingFrom(editId)
      ..todoFrom(editId);

    expect(subsc.read().length, 1);
    expect(subsc.read().first.status, TodoStatus.todo);
  });

  test('空文字列ではTODOを追加できない', () {
    final (subsc, controller) = buildSut();

    controller.add('');

    expect(subsc.read(), isEmpty);
  });
}
