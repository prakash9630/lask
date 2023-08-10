// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvoiceState {
  FormStatus get status => throw _privateConstructorUsedError;
  bool get pageLoading => throw _privateConstructorUsedError;
  InvoiceModel? get model => throw _privateConstructorUsedError;
  List<Invoices>? get invoices => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceStateCopyWith<InvoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceStateCopyWith<$Res> {
  factory $InvoiceStateCopyWith(
          InvoiceState value, $Res Function(InvoiceState) then) =
      _$InvoiceStateCopyWithImpl<$Res, InvoiceState>;
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      InvoiceModel? model,
      List<Invoices>? invoices,
      Failure? failure});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$InvoiceStateCopyWithImpl<$Res, $Val extends InvoiceState>
    implements $InvoiceStateCopyWith<$Res> {
  _$InvoiceStateCopyWithImpl(this._value, this._then);

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
    Object? invoices = freezed,
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
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as InvoiceModel?,
      invoices: freezed == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<Invoices>?,
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
    implements $InvoiceStateCopyWith<$Res> {
  factory _$$_ServicesStateCopyWith(
          _$_ServicesState value, $Res Function(_$_ServicesState) then) =
      __$$_ServicesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      InvoiceModel? model,
      List<Invoices>? invoices,
      Failure? failure});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_ServicesStateCopyWithImpl<$Res>
    extends _$InvoiceStateCopyWithImpl<$Res, _$_ServicesState>
    implements _$$_ServicesStateCopyWith<$Res> {
  __$$_ServicesStateCopyWithImpl(
      _$_ServicesState _value, $Res Function(_$_ServicesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageLoading = null,
    Object? model = freezed,
    Object? invoices = freezed,
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
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as InvoiceModel?,
      invoices: freezed == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<Invoices>?,
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
      this.model,
      final List<Invoices>? invoices,
      this.failure})
      : _invoices = invoices;

  @override
  final FormStatus status;
  @override
  final bool pageLoading;
  @override
  final InvoiceModel? model;
  final List<Invoices>? _invoices;
  @override
  List<Invoices>? get invoices {
    final value = _invoices;
    if (value == null) return null;
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'InvoiceState(status: $status, pageLoading: $pageLoading, model: $model, invoices: $invoices, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._invoices, _invoices) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, pageLoading, model,
      const DeepCollectionEquality().hash(_invoices), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      __$$_ServicesStateCopyWithImpl<_$_ServicesState>(this, _$identity);
}

abstract class _ServicesState implements InvoiceState {
  const factory _ServicesState(
      {required final FormStatus status,
      required final bool pageLoading,
      final InvoiceModel? model,
      final List<Invoices>? invoices,
      final Failure? failure}) = _$_ServicesState;

  @override
  FormStatus get status;
  @override
  bool get pageLoading;
  @override
  InvoiceModel? get model;
  @override
  List<Invoices>? get invoices;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesStateCopyWith<_$_ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
