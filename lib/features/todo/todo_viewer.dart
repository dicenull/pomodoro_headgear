import 'package:app/features/todo/todo_controller.dart';
import 'package:app/features/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ToDoViewer extends HookConsumerWidget {
  const ToDoViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final focusNode = useFocusNode();

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textController,
            focusNode: focusNode,
            decoration: const InputDecoration(labelText: '新しいテスト'),
            onSubmitted: (s) {
              ref.read(todoControllerProvider.notifier).add(s);
              textController.clear();
              focusNode.requestFocus();
            },
          ),
          const Flexible(child: _TodoList()),
        ],
      ),
    );
  }
}

class _TodoList extends ConsumerWidget {
  const _TodoList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoControllerProvider);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: todoList.length,
      itemBuilder: (context, index) => _TodoItem(todo: todoList[index]),
    );
  }
}

class _TodoItem extends HookConsumerWidget {
  const _TodoItem({
    required this.todo,
  });

  final TodoState todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              semanticLabel: '完了ボタン',
              switch (todo.status) {
                TodoStatus.done => Icons.check_box,
                _ => Icons.check_box_outline_blank,
              },
            ),
            onPressed: () {
              if (todo.status == TodoStatus.done) {
                ref.read(todoControllerProvider.notifier).todoFrom(todo.id);
              } else {
                ref.read(todoControllerProvider.notifier).doneFrom(todo.id);
              }
            },
          ),
          _StatusLabel(
            status: todo.status,
            onTap: () {
              if (todo.status == TodoStatus.todo) {
                ref.read(todoControllerProvider.notifier).doingFrom(todo.id);
              }
              if (todo.status == TodoStatus.doing) {
                ref.read(todoControllerProvider.notifier).todoFrom(todo.id);
              }
            },
          ),
        ],
      ),
      title: switch (todo.status) {
        TodoStatus.done => Text(
            todo.title,
            style: const TextStyle(decoration: TextDecoration.lineThrough),
          ),
        _ => _InlineEditor(todo),
      },
    );
  }
}

class _InlineEditor extends HookConsumerWidget {
  const _InlineEditor(this.item);

  final TodoState item;

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
            .read(todoControllerProvider.notifier)
            .edit(item.id, title: controller.text);
      },
      onSubmitted: (newValue) {
        ref
            .read(todoControllerProvider.notifier)
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

  final TodoStatus status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (status == TodoStatus.done) {
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
