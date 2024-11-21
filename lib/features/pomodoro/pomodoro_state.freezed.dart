// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PomodoroState {
  int get remainingSeconds => throw _privateConstructorUsedError;
  PomodoroStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PomodoroStateCopyWith<PomodoroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PomodoroStateCopyWith<$Res> {
  factory $PomodoroStateCopyWith(
          PomodoroState value, $Res Function(PomodoroState) then) =
      _$PomodoroStateCopyWithImpl<$Res, PomodoroState>;
  @useResult
  $Res call({int remainingSeconds, PomodoroStatus status});
}

/// @nodoc
class _$PomodoroStateCopyWithImpl<$Res, $Val extends PomodoroState>
    implements $PomodoroStateCopyWith<$Res> {
  _$PomodoroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingSeconds = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      remainingSeconds: null == remainingSeconds
          ? _value.remainingSeconds
          : remainingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PomodoroStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PomodoroStateImplCopyWith<$Res>
    implements $PomodoroStateCopyWith<$Res> {
  factory _$$PomodoroStateImplCopyWith(
          _$PomodoroStateImpl value, $Res Function(_$PomodoroStateImpl) then) =
      __$$PomodoroStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int remainingSeconds, PomodoroStatus status});
}

/// @nodoc
class __$$PomodoroStateImplCopyWithImpl<$Res>
    extends _$PomodoroStateCopyWithImpl<$Res, _$PomodoroStateImpl>
    implements _$$PomodoroStateImplCopyWith<$Res> {
  __$$PomodoroStateImplCopyWithImpl(
      _$PomodoroStateImpl _value, $Res Function(_$PomodoroStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingSeconds = null,
    Object? status = null,
  }) {
    return _then(_$PomodoroStateImpl(
      remainingSeconds: null == remainingSeconds
          ? _value.remainingSeconds
          : remainingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PomodoroStatus,
    ));
  }
}

/// @nodoc

class _$PomodoroStateImpl extends _PomodoroState {
  _$PomodoroStateImpl({required this.remainingSeconds, required this.status})
      : super._();

  @override
  final int remainingSeconds;
  @override
  final PomodoroStatus status;

  @override
  String toString() {
    return 'PomodoroState(remainingSeconds: $remainingSeconds, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PomodoroStateImpl &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remainingSeconds, status);

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PomodoroStateImplCopyWith<_$PomodoroStateImpl> get copyWith =>
      __$$PomodoroStateImplCopyWithImpl<_$PomodoroStateImpl>(this, _$identity);
}

abstract class _PomodoroState extends PomodoroState {
  factory _PomodoroState(
      {required final int remainingSeconds,
      required final PomodoroStatus status}) = _$PomodoroStateImpl;
  _PomodoroState._() : super._();

  @override
  int get remainingSeconds;
  @override
  PomodoroStatus get status;

  /// Create a copy of PomodoroState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PomodoroStateImplCopyWith<_$PomodoroStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
