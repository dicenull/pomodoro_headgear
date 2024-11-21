import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Widget createTestWidget(ProviderContainer container, Widget child) {
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      home: Scaffold(
        body: Center(child: child),
      ),
    ),
  );
}
