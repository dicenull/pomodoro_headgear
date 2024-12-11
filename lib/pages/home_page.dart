import 'package:app/features/headgear/headgear_controller.dart';
import 'package:app/features/pomodoro/pomodoro_timer.dart';
import 'package:app/features/todo/todo_viewer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(headgearControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const Column(
        children: [
          Center(child: PomodoroTimer()),
          Flexible(
            child: ToDoViewer(),
          ),
        ],
      ),
    );
  }
}
