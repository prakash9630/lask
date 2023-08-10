// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_lawyer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CallLawyerState {
  FormStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  CallLawyerModel? get model => throw _privateConstructorUsedError;
  bool? get pageLoading => throw _privateConstructorUsedError;
  List<RecentCalls>? get callList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallLawyerStateCopyWith<CallLawyerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLawyerStateCopyWith<$Res> {
  factory $CallLawyerStateCopyWith(
          CallLawyerState value, $Res Function(CallLawyerState) then) =
      _$CallLawyerStateCopyWithImpl<$Res, CallLawyerState>;
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      CallLawyerModel? model,
      bool? pageLoading,
      List<RecentCalls>? callList});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$CallLawyerStateCopyWithImpl<$Res, $Val extends CallLawyerState>
    implements $CallLawyerStateCopyWith<$Res> {
  _$CallLawyerStateCopyWithImpl(this._value, this._then);

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
    Object? pageLoading = freezed,
    Object? callList = freezed,
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
              as CallLawyerModel?,
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      callList: freezed == callList
          ? _value.callList
          : callList // ignore: cast_nullable_to_non_nullable
              as List<RecentCalls>?,
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
abstract class _$$_CallLawyerStateCopyWith<$Res>
    implements $CallLawyerStateCopyWith<$Res> {
  factory _$$_CallLawyerStateCopyWith(
          _$_CallLawyerState value, $Res Function(_$_CallLawyerState) then) =
      __$$_CallLawyerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      CallLawyerModel? model,
      bool? pageLoading,
      List<RecentCalls>? callList});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_CallLawyerStateCopyWithImpl<$Res>
    extends _$CallLawyerStateCopyWithImpl<$Res, _$_CallLawyerState>
    implements _$$_CallLawyerStateCopyWith<$Res> {
  __$$_CallLawyerStateCopyWithImpl(
      _$_CallLawyerState _value, $Res Function(_$_CallLawyerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? model = freezed,
    Object? pageLoading = freezed,
    Object? callList = freezed,
  }) {
    return _then(_$_CallLawyerState(
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
              as CallLawyerModel?,
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      callList: freezed == callList
          ? _value._callList
          : callList // ignore: cast_nullable_to_non_nullable
              as List<RecentCalls>?,
    ));
  }
}

/// @nodoc

class _$_CallLawyerState implements _CallLawyerState {
  const _$_CallLawyerState(
      {required this.status,
      this.failure,
      this.model,
      this.pageLoading,
      final List<RecentCalls>? callList})
      : _callList = callList;

  @override
  final FormStatus status;
  @override
  final Failure? failure;
  @override
  final CallLawyerModel? model;
  @override
  final bool? pageLoading;
  final List<RecentCalls>? _callList;
  @override
  List<RecentCalls>? get callList {
    final value = _callList;
    if (value == null) return null;
    if (_callList is EqualUnmodifiableListView) return _callList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CallLawyerState(status: $status, failure: $failure, model: $model, pageLoading: $pageLoading, callList: $callList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CallLawyerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            const DeepCollectionEquality().equals(other._callList, _callList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure, model,
      pageLoading, const DeepCollectionEquality().hash(_callList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallLawyerStateCopyWith<_$_CallLawyerState> get copyWith =>
      __$$_CallLawyerStateCopyWithImpl<_$_CallLawyerState>(this, _$identity);
}

abstract class _CallLawyerState implements CallLawyerState {
  const factory _CallLawyerState(
      {required final FormStatus status,
      final Failure? failure,
      final CallLawyerModel? model,
      final bool? pageLoading,
      final List<RecentCalls>? callList}) = _$_CallLawyerState;

  @override
  FormStatus get status;
  @override
  Failure? get failure;
  @override
  CallLawyerModel? get model;
  @override
  bool? get pageLoading;
  @override
  List<RecentCalls>? get callList;
  @override
  @JsonKey(ignore: true)
  _$$_CallLawyerStateCopyWith<_$_CallLawyerState> get copyWith =>
      throw _privateConstructorUsedError;
}
