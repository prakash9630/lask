// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'used_voucher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsedVoucherState {
  FormStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool? get isPageLoading => throw _privateConstructorUsedError;
  VoucherModel? get model => throw _privateConstructorUsedError;
  List<Vouchers>? get voucherList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsedVoucherStateCopyWith<UsedVoucherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsedVoucherStateCopyWith<$Res> {
  factory $UsedVoucherStateCopyWith(
          UsedVoucherState value, $Res Function(UsedVoucherState) then) =
      _$UsedVoucherStateCopyWithImpl<$Res, UsedVoucherState>;
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      bool? isPageLoading,
      VoucherModel? model,
      List<Vouchers>? voucherList});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$UsedVoucherStateCopyWithImpl<$Res, $Val extends UsedVoucherState>
    implements $UsedVoucherStateCopyWith<$Res> {
  _$UsedVoucherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? isPageLoading = freezed,
    Object? model = freezed,
    Object? voucherList = freezed,
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
      isPageLoading: freezed == isPageLoading
          ? _value.isPageLoading
          : isPageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VoucherModel?,
      voucherList: freezed == voucherList
          ? _value.voucherList
          : voucherList // ignore: cast_nullable_to_non_nullable
              as List<Vouchers>?,
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
abstract class _$$_UsedVoucherStateCopyWith<$Res>
    implements $UsedVoucherStateCopyWith<$Res> {
  factory _$$_UsedVoucherStateCopyWith(
          _$_UsedVoucherState value, $Res Function(_$_UsedVoucherState) then) =
      __$$_UsedVoucherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      bool? isPageLoading,
      VoucherModel? model,
      List<Vouchers>? voucherList});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_UsedVoucherStateCopyWithImpl<$Res>
    extends _$UsedVoucherStateCopyWithImpl<$Res, _$_UsedVoucherState>
    implements _$$_UsedVoucherStateCopyWith<$Res> {
  __$$_UsedVoucherStateCopyWithImpl(
      _$_UsedVoucherState _value, $Res Function(_$_UsedVoucherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? isPageLoading = freezed,
    Object? model = freezed,
    Object? voucherList = freezed,
  }) {
    return _then(_$_UsedVoucherState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isPageLoading: freezed == isPageLoading
          ? _value.isPageLoading
          : isPageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as VoucherModel?,
      voucherList: freezed == voucherList
          ? _value._voucherList
          : voucherList // ignore: cast_nullable_to_non_nullable
              as List<Vouchers>?,
    ));
  }
}

/// @nodoc

class _$_UsedVoucherState implements _UsedVoucherState {
  const _$_UsedVoucherState(
      {required this.status,
      this.failure,
      this.isPageLoading,
      this.model,
      final List<Vouchers>? voucherList})
      : _voucherList = voucherList;

  @override
  final FormStatus status;
  @override
  final Failure? failure;
  @override
  final bool? isPageLoading;
  @override
  final VoucherModel? model;
  final List<Vouchers>? _voucherList;
  @override
  List<Vouchers>? get voucherList {
    final value = _voucherList;
    if (value == null) return null;
    if (_voucherList is EqualUnmodifiableListView) return _voucherList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UsedVoucherState(status: $status, failure: $failure, isPageLoading: $isPageLoading, model: $model, voucherList: $voucherList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsedVoucherState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isPageLoading, isPageLoading) ||
                other.isPageLoading == isPageLoading) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality()
                .equals(other._voucherList, _voucherList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure, isPageLoading,
      model, const DeepCollectionEquality().hash(_voucherList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsedVoucherStateCopyWith<_$_UsedVoucherState> get copyWith =>
      __$$_UsedVoucherStateCopyWithImpl<_$_UsedVoucherState>(this, _$identity);
}

abstract class _UsedVoucherState implements UsedVoucherState {
  const factory _UsedVoucherState(
      {required final FormStatus status,
      final Failure? failure,
      final bool? isPageLoading,
      final VoucherModel? model,
      final List<Vouchers>? voucherList}) = _$_UsedVoucherState;

  @override
  FormStatus get status;
  @override
  Failure? get failure;
  @override
  bool? get isPageLoading;
  @override
  VoucherModel? get model;
  @override
  List<Vouchers>? get voucherList;
  @override
  @JsonKey(ignore: true)
  _$$_UsedVoucherStateCopyWith<_$_UsedVoucherState> get copyWith =>
      throw _privateConstructorUsedError;
}
