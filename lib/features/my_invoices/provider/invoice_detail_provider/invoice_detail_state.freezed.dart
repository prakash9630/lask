// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvoiceDetailState {
  FormStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceDetailStateCopyWith<InvoiceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailStateCopyWith<$Res> {
  factory $InvoiceDetailStateCopyWith(
          InvoiceDetailState value, $Res Function(InvoiceDetailState) then) =
      _$InvoiceDetailStateCopyWithImpl<$Res, InvoiceDetailState>;
  @useResult
  $Res call({FormStatus status});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$InvoiceDetailStateCopyWithImpl<$Res, $Val extends InvoiceDetailState>
    implements $InvoiceDetailStateCopyWith<$Res> {
  _$InvoiceDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
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
abstract class _$$_InvoiceDetailStateCopyWith<$Res>
    implements $InvoiceDetailStateCopyWith<$Res> {
  factory _$$_InvoiceDetailStateCopyWith(_$_InvoiceDetailState value,
          $Res Function(_$_InvoiceDetailState) then) =
      __$$_InvoiceDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormStatus status});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_InvoiceDetailStateCopyWithImpl<$Res>
    extends _$InvoiceDetailStateCopyWithImpl<$Res, _$_InvoiceDetailState>
    implements _$$_InvoiceDetailStateCopyWith<$Res> {
  __$$_InvoiceDetailStateCopyWithImpl(
      _$_InvoiceDetailState _value, $Res Function(_$_InvoiceDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_InvoiceDetailState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
    ));
  }
}

/// @nodoc

class _$_InvoiceDetailState implements _InvoiceDetailState {
  const _$_InvoiceDetailState({required this.status});

  @override
  final FormStatus status;

  @override
  String toString() {
    return 'InvoiceDetailState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceDetailState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceDetailStateCopyWith<_$_InvoiceDetailState> get copyWith =>
      __$$_InvoiceDetailStateCopyWithImpl<_$_InvoiceDetailState>(
          this, _$identity);
}

abstract class _InvoiceDetailState implements InvoiceDetailState {
  const factory _InvoiceDetailState({required final FormStatus status}) =
      _$_InvoiceDetailState;

  @override
  FormStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceDetailStateCopyWith<_$_InvoiceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
