// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServicesState {
  FormStatus get status => throw _privateConstructorUsedError;
  bool get pageLoading => throw _privateConstructorUsedError;
  ServiceModel? get data => throw _privateConstructorUsedError;
  List<Services>? get serviceList => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res, ServicesState>;
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      ServiceModel? data,
      List<Services>? serviceList,
      Failure? failure});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res, $Val extends ServicesState>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageLoading = null,
    Object? data = freezed,
    Object? serviceList = freezed,
    Object? failure = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      serviceList: freezed == serviceList
          ? _value.serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<Services>?,
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
abstract class _$$_ServicesStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$$_ServicesStateCopyWith(
          _$_ServicesState value, $Res Function(_$_ServicesState) then) =
      __$$_ServicesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      ServiceModel? data,
      List<Services>? serviceList,
      Failure? failure});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_ServicesStateCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$_ServicesState>
    implements _$$_ServicesStateCopyWith<$Res> {
  __$$_ServicesStateCopyWithImpl(
      _$_ServicesState _value, $Res Function(_$_ServicesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageLoading = null,
    Object? data = freezed,
    Object? serviceList = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_ServicesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      pageLoading: null == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      serviceList: freezed == serviceList
          ? _value._serviceList
          : serviceList // ignore: cast_nullable_to_non_nullable
              as List<Services>?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_ServicesState implements _ServicesState {
  const _$_ServicesState(
      {required this.status,
      required this.pageLoading,
      this.data,
      final List<Services>? serviceList,
      this.failure})
      : _serviceList = serviceList;

  @override
  final FormStatus status;
  @override
  final bool pageLoading;
  @override
  final ServiceModel? data;
  final List<Services>? _serviceList;
  @override
  List<Services>? get serviceList {
    final value = _serviceList;
    if (value == null) return null;
    if (_serviceList is EqualUnmodifiableListView) return _serviceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ServicesState(status: $status, pageLoading: $pageLoading, data: $data, serviceList: $serviceList, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other._serviceList, _serviceList) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, pageLoading, data,
      const DeepCollectionEquality().hash(_serviceList), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      __$$_ServicesStateCopyWithImpl<_$_ServicesState>(this, _$identity);
}

abstract class _ServicesState implements ServicesState {
  const factory _ServicesState(
      {required final FormStatus status,
      required final bool pageLoading,
      final ServiceModel? data,
      final List<Services>? serviceList,
      final Failure? failure}) = _$_ServicesState;

  @override
  FormStatus get status;
  @override
  bool get pageLoading;
  @override
  ServiceModel? get data;
  @override
  List<Services>? get serviceList;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
