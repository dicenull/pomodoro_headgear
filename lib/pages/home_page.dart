import 'package:app/features/pomodoro/pomodoro_timer.dart';
import 'package:app/features/test_list/test_list_viewer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const Column(
        children: [
          Center(child: PomodoroTimer()),
          Center(child: TestListViewer()),
        ],
      ),
    );
  }
}
