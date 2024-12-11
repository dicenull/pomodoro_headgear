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
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                status.label,
                style: theme.textTheme.displaySmall,
              ),
              const Gap(16),
              const _Timer(),
            ],
          ),
        ),
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

class _Timer extends ConsumerWidget {
  const _Timer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seconds = ref.watch(pomodoroControllerProvider.select((v) => v.time));
    final theme = Theme.of(context);

    return Text(
      seconds,
      style: theme.textTheme.displaySmall?.copyWith(
        fontFamily: 'Helvetica',
      ),
      textAlign: TextAlign.start,
    );
  }
}
