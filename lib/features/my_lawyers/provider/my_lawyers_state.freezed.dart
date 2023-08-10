// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_lawyers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyLawyersState {
  FormStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  MyLawyersModel? get model => throw _privateConstructorUsedError;
  List<Lawyer>? get lawyers => throw _privateConstructorUsedError;
  bool? get pageLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyLawyersStateCopyWith<MyLawyersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyLawyersStateCopyWith<$Res> {
  factory $MyLawyersStateCopyWith(
          MyLawyersState value, $Res Function(MyLawyersState) then) =
      _$MyLawyersStateCopyWithImpl<$Res, MyLawyersState>;
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      MyLawyersModel? model,
      List<Lawyer>? lawyers,
      bool? pageLoading});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$MyLawyersStateCopyWithImpl<$Res, $Val extends MyLawyersState>
    implements $MyLawyersStateCopyWith<$Res> {
  _$MyLawyersStateCopyWithImpl(this._value, this._then);

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
    Object? lawyers = freezed,
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
              as MyLawyersModel?,
      lawyers: freezed == lawyers
          ? _value.lawyers
          : lawyers // ignore: cast_nullable_to_non_nullable
              as List<Lawyer>?,
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
abstract class _$$_MyLawyersStateCopyWith<$Res>
    implements $MyLawyersStateCopyWith<$Res> {
  factory _$$_MyLawyersStateCopyWith(
          _$_MyLawyersState value, $Res Function(_$_MyLawyersState) then) =
      __$$_MyLawyersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      MyLawyersModel? model,
      List<Lawyer>? lawyers,
      bool? pageLoading});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_MyLawyersStateCopyWithImpl<$Res>
    extends _$MyLawyersStateCopyWithImpl<$Res, _$_MyLawyersState>
    implements _$$_MyLawyersStateCopyWith<$Res> {
  __$$_MyLawyersStateCopyWithImpl(
      _$_MyLawyersState _value, $Res Function(_$_MyLawyersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? model = freezed,
    Object? lawyers = freezed,
    Object? pageLoading = freezed,
  }) {
    return _then(_$_MyLawyersState(
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
              as MyLawyersModel?,
      lawyers: freezed == lawyers
          ? _value._lawyers
          : lawyers // ignore: cast_nullable_to_non_nullable
              as List<Lawyer>?,
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_MyLawyersState implements _MyLawyersState {
  const _$_MyLawyersState(
      {required this.status,
      this.failure,
      this.model,
      final List<Lawyer>? lawyers,
      this.pageLoading})
      : _lawyers = lawyers;

  @override
  final FormStatus status;
  @override
  final Failure? failure;
  @override
  final MyLawyersModel? model;
  final List<Lawyer>? _lawyers;
  @override
  List<Lawyer>? get lawyers {
    final value = _lawyers;
    if (value == null) return null;
    if (_lawyers is EqualUnmodifiableListView) return _lawyers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? pageLoading;

  @override
  String toString() {
    return 'MyLawyersState(status: $status, failure: $failure, model: $model, lawyers: $lawyers, pageLoading: $pageLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyLawyersState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._lawyers, _lawyers) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure, model,
      const DeepCollectionEquality().hash(_lawyers), pageLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyLawyersStateCopyWith<_$_MyLawyersState> get copyWith =>
      __$$_MyLawyersStateCopyWithImpl<_$_MyLawyersState>(this, _$identity);
}

abstract class _MyLawyersState implements MyLawyersState {
  const factory _MyLawyersState(
      {required final FormStatus status,
      final Failure? failure,
      final MyLawyersModel? model,
      final List<Lawyer>? lawyers,
      final bool? pageLoading}) = _$_MyLawyersState;

  @override
  FormStatus get status;
  @override
  Failure? get failure;
  @override
  MyLawyersModel? get model;
  @override
  List<Lawyer>? get lawyers;
  @override
  bool? get pageLoading;
  @override
  @JsonKey(ignore: true)
  _$$_MyLawyersStateCopyWith<_$_MyLawyersState> get copyWith =>
      throw _privateConstructorUsedError;
}
