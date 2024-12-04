import 'package:app/features/test_list/test_list_viewer.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../create_container_test.dart';
import '../../widget_test_app.dart';

void main() {
  testWidgets('$TestListViewer テストの追加から完了まで', (tester) async {
    final container = createContainer();
    final widget = createTestWidget(container, const TestListViewer());

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
  });
}
