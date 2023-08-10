// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SupportState {
  FormStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  SupportModel? get model => throw _privateConstructorUsedError;
  List<Support>? get supports => throw _privateConstructorUsedError;
  bool? get pageLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupportStateCopyWith<SupportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportStateCopyWith<$Res> {
  factory $SupportStateCopyWith(
          SupportState value, $Res Function(SupportState) then) =
      _$SupportStateCopyWithImpl<$Res, SupportState>;
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      SupportModel? model,
      List<Support>? supports,
      bool? pageLoading});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$SupportStateCopyWithImpl<$Res, $Val extends SupportState>
    implements $SupportStateCopyWith<$Res> {
  _$SupportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? model = freezed,
    Object? supports = freezed,
    Object? pageLoading = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SupportModel?,
      supports: freezed == supports
          ? _value.supports
          : supports // ignore: cast_nullable_to_non_nullable
              as List<Support>?,
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$_SupportStateCopyWith<$Res>
    implements $SupportStateCopyWith<$Res> {
  factory _$$_SupportStateCopyWith(
          _$_SupportState value, $Res Function(_$_SupportState) then) =
      __$$_SupportStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      SupportModel? model,
      List<Support>? supports,
      bool? pageLoading});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_SupportStateCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$_SupportState>
    implements _$$_SupportStateCopyWith<$Res> {
  __$$_SupportStateCopyWithImpl(
      _$_SupportState _value, $Res Function(_$_SupportState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? model = freezed,
    Object? supports = freezed,
    Object? pageLoading = freezed,
  }) {
    return _then(_$_SupportState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SupportModel?,
      supports: freezed == supports
          ? _value._supports
          : supports // ignore: cast_nullable_to_non_nullable
              as List<Support>?,
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_SupportState implements _SupportState {
  const _$_SupportState(
      {required this.status,
      this.failure,
      this.model,
      final List<Support>? supports,
      this.pageLoading})
      : _supports = supports;

  @override
  final FormStatus status;
  @override
  final Failure? failure;
  @override
  final SupportModel? model;
  final List<Support>? _supports;
  @override
  List<Support>? get supports {
    final value = _supports;
    if (value == null) return null;
    if (_supports is EqualUnmodifiableListView) return _supports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? pageLoading;

  @override
  String toString() {
    return 'SupportState(status: $status, failure: $failure, model: $model, supports: $supports, pageLoading: $pageLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._supports, _supports) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure, model,
      const DeepCollectionEquality().hash(_supports), pageLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportStateCopyWith<_$_SupportState> get copyWith =>
      __$$_SupportStateCopyWithImpl<_$_SupportState>(this, _$identity);
}

abstract class _SupportState implements SupportState {
  const factory _SupportState(
      {required final FormStatus status,
      final Failure? failure,
      final SupportModel? model,
      final List<Support>? supports,
      final bool? pageLoading}) = _$_SupportState;

  @override
  FormStatus get status;
  @override
  Failure? get failure;
  @override
  SupportModel? get model;
  @override
  List<Support>? get supports;
  @override
  bool? get pageLoading;
  @override
  @JsonKey(ignore: true)
  _$$_SupportStateCopyWith<_$_SupportState> get copyWith =>
      throw _privateConstructorUsedError;
}
