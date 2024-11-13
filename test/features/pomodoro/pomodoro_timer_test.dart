import 'package:app/features/pomodoro/pomodoro_timer.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../create_container_test.dart';
import '../../widget_test_app.dart';

void main() {
  testWidgets('ポモドーロ開始して休憩を挟んで停止できる', (tester) async {
    final container = createContainer();
    final widget = createTestWidget(container, const PomodoroTimer());

    await tester.pumpWidget(widget);

    // 1回目のポモドーロ開始
    await tester.tap(find.bySemanticsLabel('開始'));
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('作業'), findsOneWidget);
    expect(find.bySemanticsLabel('停止'), findsOneWidget);
    await tester.pump(const Duration(minutes: 25));

    // 1回終わって休憩
    expect(find.bySemanticsLabel('小休憩'), findsOneWidget);
    expect(find.bySemanticsLabel('停止'), findsOneWidget);
    await tester.pump(const Duration(minutes: 5));

    // 2回目のポモドーロ開始
    expect(find.bySemanticsLabel('作業'), findsOneWidget);
    expect(find.bySemanticsLabel('停止'), findsOneWidget);

    // すぐに停止
    await tester.tap(find.bySemanticsLabel('停止'));
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('開始'), findsOneWidget);

    // 停止中は変わらない
    await tester.pump(const Duration(minutes: 30));
    expect(find.bySemanticsLabel('お休み'), findsOneWidget);
    expect(find.bySemanticsLabel('開始'), findsOneWidget);

    // 2回目再開
    await tester.tap(find.bySemanticsLabel('開始'));
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('作業'), findsOneWidget);
    expect(find.bySemanticsLabel('停止'), findsOneWidget);
    await tester.pump(const Duration(minutes: 25));

    // 2回終わって休憩
    expect(find.bySemanticsLabel('小休憩'), findsOneWidget);
    expect(find.bySemanticsLabel('停止'), findsOneWidget);

    await tester.pumpAndSettle();
    container.dispose();
  });
}
