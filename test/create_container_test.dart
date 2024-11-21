// https://riverpod.dev/ja/docs/essentials/testing
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [ProviderContainer]を作成し、テスト終了時に自動破棄するテストユーティリティです。
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // ProviderContainerを作成し、オプションでパラメータを指定します。
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // テスト終了時、containerを破棄します。
  addTearDown(container.dispose);

  return container;
}
