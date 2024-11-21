// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestState {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  TestStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestStateCopyWith<TestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestStateCopyWith<$Res> {
  factory $TestStateCopyWith(TestState value, $Res Function(TestState) then) =
      _$TestStateCopyWithImpl<$Res, TestState>;
  @useResult
  $Res call({String id, String title, TestStatus status});
}

/// @nodoc
class _$TestStateCopyWithImpl<$Res, $Val extends TestState>
    implements $TestStateCopyWith<$Res> {
  _$TestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TestStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestStateImplCopyWith<$Res>
    implements $TestStateCopyWith<$Res> {
  factory _$$TestStateImplCopyWith(
          _$TestStateImpl value, $Res Function(_$TestStateImpl) then) =
      __$$TestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, TestStatus status});
}

/// @nodoc
class __$$TestStateImplCopyWithImpl<$Res>
    extends _$TestStateCopyWithImpl<$Res, _$TestStateImpl>
    implements _$$TestStateImplCopyWith<$Res> {
  __$$TestStateImplCopyWithImpl(
      _$TestStateImpl _value, $Res Function(_$TestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
  }) {
    return _then(_$TestStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TestStatus,
    ));
  }
}

/// @nodoc

class _$TestStateImpl implements _TestState {
  _$TestStateImpl(
      {required this.id, required this.title, required this.status});

  @override
  final String id;
  @override
  final String title;
  @override
  final TestStatus status;

  @override
  String toString() {
    return 'TestState(id: $id, title: $title, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, status);

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestStateImplCopyWith<_$TestStateImpl> get copyWith =>
      __$$TestStateImplCopyWithImpl<_$TestStateImpl>(this, _$identity);
}

abstract class _TestState implements TestState {
  factory _TestState(
      {required final String id,
      required final String title,
      required final TestStatus status}) = _$TestStateImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  TestStatus get status;

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestStateImplCopyWith<_$TestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
