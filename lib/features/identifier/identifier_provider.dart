import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'identifier_provider.g.dart';

@Riverpod(keepAlive: true)
Uuid uuid(Ref ref) => const Uuid();
