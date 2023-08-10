// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tariffs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TariffsState {
  FormStatus get status => throw _privateConstructorUsedError;
  bool get pageLoading => throw _privateConstructorUsedError;
  TariffsModel? get model => throw _privateConstructorUsedError;
  List<Tariffs>? get tariffs => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  int? get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TariffsStateCopyWith<TariffsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TariffsStateCopyWith<$Res> {
  factory $TariffsStateCopyWith(
          TariffsState value, $Res Function(TariffsState) then) =
      _$TariffsStateCopyWithImpl<$Res, TariffsState>;
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      TariffsModel? model,
      List<Tariffs>? tariffs,
      Failure? failure,
      int? selectedIndex});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$TariffsStateCopyWithImpl<$Res, $Val extends TariffsState>
    implements $TariffsStateCopyWith<$Res> {
  _$TariffsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageLoading = null,
    Object? model = freezed,
    Object? tariffs = freezed,
    Object? failure = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      pageLoading: null == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TariffsModel?,
      tariffs: freezed == tariffs
          ? _value.tariffs
          : tariffs // ignore: cast_nullable_to_non_nullable
              as List<Tariffs>?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_TariffsStateCopyWith<$Res>
    implements $TariffsStateCopyWith<$Res> {
  factory _$$_TariffsStateCopyWith(
          _$_TariffsState value, $Res Function(_$_TariffsState) then) =
      __$$_TariffsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      TariffsModel? model,
      List<Tariffs>? tariffs,
      Failure? failure,
      int? selectedIndex});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_TariffsStateCopyWithImpl<$Res>
    extends _$TariffsStateCopyWithImpl<$Res, _$_TariffsState>
    implements _$$_TariffsStateCopyWith<$Res> {
  __$$_TariffsStateCopyWithImpl(
      _$_TariffsState _value, $Res Function(_$_TariffsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageLoading = null,
    Object? model = freezed,
    Object? tariffs = freezed,
    Object? failure = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_$_TariffsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      pageLoading: null == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TariffsModel?,
      tariffs: freezed == tariffs
          ? _value._tariffs
          : tariffs // ignore: cast_nullable_to_non_nullable
              as List<Tariffs>?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_TariffsState implements _TariffsState {
  const _$_TariffsState(
      {required this.status,
      required this.pageLoading,
      this.model,
      final List<Tariffs>? tariffs,
      this.failure,
      this.selectedIndex})
      : _tariffs = tariffs;

  @override
  final FormStatus status;
  @override
  final bool pageLoading;
  @override
  final TariffsModel? model;
  final List<Tariffs>? _tariffs;
  @override
  List<Tariffs>? get tariffs {
    final value = _tariffs;
    if (value == null) return null;
    if (_tariffs is EqualUnmodifiableListView) return _tariffs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Failure? failure;
  @override
  final int? selectedIndex;

  @override
  String toString() {
    return 'TariffsState(status: $status, pageLoading: $pageLoading, model: $model, tariffs: $tariffs, failure: $failure, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TariffsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._tariffs, _tariffs) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, pageLoading, model,
      const DeepCollectionEquality().hash(_tariffs), failure, selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TariffsStateCopyWith<_$_TariffsState> get copyWith =>
      __$$_TariffsStateCopyWithImpl<_$_TariffsState>(this, _$identity);
}

abstract class _TariffsState implements TariffsState {
  const factory _TariffsState(
      {required final FormStatus status,
      required final bool pageLoading,
      final TariffsModel? model,
      final List<Tariffs>? tariffs,
      final Failure? failure,
      final int? selectedIndex}) = _$_TariffsState;

  @override
  FormStatus get status;
  @override
  bool get pageLoading;
  @override
  TariffsModel? get model;
  @override
  List<Tariffs>? get tariffs;
  @override
  Failure? get failure;
  @override
  int? get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$_TariffsStateCopyWith<_$_TariffsState> get copyWith =>
      throw _privateConstructorUsedError;
}
