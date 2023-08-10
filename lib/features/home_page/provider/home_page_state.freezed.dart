// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageState {
  FormStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  HomePageModel? get model => throw _privateConstructorUsedError;
  List<RecentCalls>? get recentCalls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      HomePageModel? model,
      List<RecentCalls>? recentCalls});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

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
    Object? recentCalls = freezed,
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
              as HomePageModel?,
      recentCalls: freezed == recentCalls
          ? _value.recentCalls
          : recentCalls // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      HomePageModel? model,
      List<RecentCalls>? recentCalls});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_HomePageState>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? model = freezed,
    Object? recentCalls = freezed,
  }) {
    return _then(_$_HomePageState(
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
              as HomePageModel?,
      recentCalls: freezed == recentCalls
          ? _value._recentCalls
          : recentCalls // ignore: cast_nullable_to_non_nullable
              as List<RecentCalls>?,
    ));
  }
}

/// @nodoc

class _$_HomePageState implements _HomePageState {
  const _$_HomePageState(
      {required this.status,
      this.failure,
      this.model,
      final List<RecentCalls>? recentCalls})
      : _recentCalls = recentCalls;

  @override
  final FormStatus status;
  @override
  final Failure? failure;
  @override
  final HomePageModel? model;
  final List<RecentCalls>? _recentCalls;
  @override
  List<RecentCalls>? get recentCalls {
    final value = _recentCalls;
    if (value == null) return null;
    if (_recentCalls is EqualUnmodifiableListView) return _recentCalls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomePageState(status: $status, failure: $failure, model: $model, recentCalls: $recentCalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality()
                .equals(other._recentCalls, _recentCalls));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure, model,
      const DeepCollectionEquality().hash(_recentCalls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {required final FormStatus status,
      final Failure? failure,
      final HomePageModel? model,
      final List<RecentCalls>? recentCalls}) = _$_HomePageState;

  @override
  FormStatus get status;
  @override
  Failure? get failure;
  @override
  HomePageModel? get model;
  @override
  List<RecentCalls>? get recentCalls;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
