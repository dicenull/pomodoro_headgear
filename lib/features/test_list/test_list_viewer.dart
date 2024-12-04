import 'package:app/features/test_list/test_list_controller.dart';
import 'package:app/features/test_list/test_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestListViewer extends HookConsumerWidget {
  const TestListViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testList = ref.watch(testListControllerProvider);
    final textController = useTextEditingController();
    final focusNode = useFocusNode();

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          TextField(
            controller: textController,
            focusNode: focusNode,
            decoration: const InputDecoration(labelText: '新しいテスト'),
            onSubmitted: (s) {
              ref.read(testListControllerProvider.notifier).add(s);
              textController.clear();
              focusNode.requestFocus();
            },
          ),
          for (final item in testList) _TestItem(item: item),
        ],
      ),
    );
  }
}

class _TestItem extends HookConsumerWidget {
  const _TestItem({
    required this.item,
  });

  final TestState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              semanticLabel: '完了ボタン',
              switch (item.status) {
                TestStatus.done => Icons.check_box,
                _ => Icons.check_box_outline_blank,
              },
            ),
            onPressed: () {
              if (item.status == TestStatus.done) {
                ref.read(testListControllerProvider.notifier).todoFrom(item.id);
              } else {
                ref.read(testListControllerProvider.notifier).doneFrom(item.id);
              }
            },
          ),
          _StatusLabel(
            status: item.status,
            onTap: () {
              if (item.status == TestStatus.todo) {
                ref
                    .read(testListControllerProvider.notifier)
                    .doingFrom(item.id);
              }
              if (item.status == TestStatus.doing) {
                ref.read(testListControllerProvider.notifier).todoFrom(item.id);
              }
            },
          ),
        ],
      ),
      title: switch (item.status) {
        TestStatus.done => Text(
            item.title,
            style: const TextStyle(decoration: TextDecoration.lineThrough),
          ),
        _ => _InlineEditor(item),
      },
    );
  }
}

class _InlineEditor extends HookConsumerWidget {
  const _InlineEditor(this.item);

  final TestState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController(text: item.title);
    final focusNode = useFocusNode();

    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        hintText: 'タスク名',
      ),
      onTapOutside: (event) {
        ref
            .read(testListControllerProvider.notifier)
            .edit(item.id, title: controller.text);
      },
      onSubmitted: (newValue) {
        ref
            .read(testListControllerProvider.notifier)
            .edit(item.id, title: controller.text);
      },
    );
  }
}

class _StatusLabel extends StatelessWidget {
  const _StatusLabel({
    required this.status,
    required this.onTap,
  });

  final TestStatus status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (status == TestStatus.done) {
      return const SizedBox.shrink();
    }
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: 40,
          child: Text(
            status.label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
