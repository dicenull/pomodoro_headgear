import 'package:app/features/todo/todo_viewer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../create_container.dart';
import '../../widget_test_app.dart';

void main() {
  testWidgets('$ToDoViewer TODOの追加から完了まで', (tester) async {
    final container = createContainer();
    final widget = createTestWidget(
      container,
      const SizedBox(
        height: 500,
        child: ToDoViewer(),
      ),
    );

    await tester.pumpWidget(widget);

    await tester.enterText(find.bySemanticsLabel('新しいテスト'), '足し算ができる');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.enterText(find.bySemanticsLabel('新しいテスト'), '引き算ができる');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('TODO').first);
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('完了ボタン').first);
    await tester.pumpAndSettle();

    expect(find.text('足し算ができる'), findsOneWidget);
    expect(find.text('引き算ができる'), findsOneWidget);

    await expectLater(
      find.byType(ToDoViewer),
      matchesGoldenFile('golden/$ToDoViewer.png'),
    );
  });
}
