import 'package:freezed_annotation/freezed_annotation.dart';

part 'headgear_state.freezed.dart';

@freezed
abstract class HeadgearState with _$HeadgearState {
  factory HeadgearState({
    @Default(false) bool flag,
  }) = _HeadgearState;
}
