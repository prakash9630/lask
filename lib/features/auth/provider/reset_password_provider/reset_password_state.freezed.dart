// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordState {
  DataStatus get status => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String? get oldPassword => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {DataStatus status,
      String newPassword,
      String? oldPassword,
      Failure? failure});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? newPassword = null,
    Object? oldPassword = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: freezed == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordStateCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$_ResetPasswordStateCopyWith(_$_ResetPasswordState value,
          $Res Function(_$_ResetPasswordState) then) =
      __$$_ResetPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStatus status,
      String newPassword,
      String? oldPassword,
      Failure? failure});
}

/// @nodoc
class __$$_ResetPasswordStateCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$_ResetPasswordState>
    implements _$$_ResetPasswordStateCopyWith<$Res> {
  __$$_ResetPasswordStateCopyWithImpl(
      _$_ResetPasswordState _value, $Res Function(_$_ResetPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? newPassword = null,
    Object? oldPassword = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_ResetPasswordState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: freezed == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordState implements _ResetPasswordState {
  const _$_ResetPasswordState(
      {required this.status,
      required this.newPassword,
      this.oldPassword,
      this.failure});

  @override
  final DataStatus status;
  @override
  final String newPassword;
  @override
  final String? oldPassword;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ResetPasswordState(status: $status, newPassword: $newPassword, oldPassword: $oldPassword, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, newPassword, oldPassword, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      __$$_ResetPasswordStateCopyWithImpl<_$_ResetPasswordState>(
          this, _$identity);
}

abstract class _ResetPasswordState implements ResetPasswordState {
  const factory _ResetPasswordState(
      {required final DataStatus status,
      required final String newPassword,
      final String? oldPassword,
      final Failure? failure}) = _$_ResetPasswordState;

  @override
  DataStatus get status;
  @override
  String get newPassword;
  @override
  String? get oldPassword;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
