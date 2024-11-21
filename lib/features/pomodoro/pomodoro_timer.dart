import 'package:app/features/pomodoro/pomodoro_controller.dart';
import 'package:app/features/pomodoro/pomodoro_state.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PomodoroTimer extends HookConsumerWidget {
  const PomodoroTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status =
        ref.watch(pomodoroControllerProvider.select((v) => v.status));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(status.label),
        const Gap(16),
        IconButton.filled(
          onPressed: () {
            if (status == PomodoroStatus.rest) {
              ref.read(pomodoroControllerProvider.notifier).start();
              return;
            }

            ref.read(pomodoroControllerProvider.notifier).rest();
          },
          icon: switch (status) {
            PomodoroStatus.rest =>
              const Icon(Icons.play_arrow, semanticLabel: '開始'),
            _ => const Icon(Icons.stop, semanticLabel: '停止'),
          },
        ),
      ],
    );
  }
}
