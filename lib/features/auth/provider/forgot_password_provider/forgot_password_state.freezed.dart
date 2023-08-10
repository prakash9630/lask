// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordState {
  FormStatus get status => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  ForgotPassModel? get model => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
  @useResult
  $Res call(
      {FormStatus status,
      String email,
      ForgotPassModel? model,
      Failure? failure});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? model = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ForgotPassModel?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormStatusCopyWith<$Res> get status {
    return $FormStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordStateCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$_ForgotPasswordStateCopyWith(_$_ForgotPasswordState value,
          $Res Function(_$_ForgotPasswordState) then) =
      __$$_ForgotPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      String email,
      ForgotPassModel? model,
      Failure? failure});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_ForgotPasswordStateCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$_ForgotPasswordState>
    implements _$$_ForgotPasswordStateCopyWith<$Res> {
  __$$_ForgotPasswordStateCopyWithImpl(_$_ForgotPasswordState _value,
      $Res Function(_$_ForgotPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? model = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_ForgotPasswordState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ForgotPassModel?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordState implements _ForgotPasswordState {
  const _$_ForgotPasswordState(
      {required this.status, required this.email, this.model, this.failure});

  @override
  final FormStatus status;
  @override
  final String email;
  @override
  final ForgotPassModel? model;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ForgotPasswordState(status: $status, email: $email, model: $model, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, model, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordStateCopyWith<_$_ForgotPasswordState> get copyWith =>
      __$$_ForgotPasswordStateCopyWithImpl<_$_ForgotPasswordState>(
          this, _$identity);
}

abstract class _ForgotPasswordState implements ForgotPasswordState {
  const factory _ForgotPasswordState(
      {required final FormStatus status,
      required final String email,
      final ForgotPassModel? model,
      final Failure? failure}) = _$_ForgotPasswordState;

  @override
  FormStatus get status;
  @override
  String get email;
  @override
  ForgotPassModel? get model;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordStateCopyWith<_$_ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
