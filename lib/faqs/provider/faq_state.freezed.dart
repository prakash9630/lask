// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FaqState {
  FormStatus get status => throw _privateConstructorUsedError;
  FaqModel? get model => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  List<Faqs>? get faqs => throw _privateConstructorUsedError;
  bool? get pageLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaqStateCopyWith<FaqState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqStateCopyWith<$Res> {
  factory $FaqStateCopyWith(FaqState value, $Res Function(FaqState) then) =
      _$FaqStateCopyWithImpl<$Res, FaqState>;
  @useResult
  $Res call(
      {FormStatus status,
      FaqModel? model,
      Failure? failure,
      List<Faqs>? faqs,
      bool? pageLoading});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$FaqStateCopyWithImpl<$Res, $Val extends FaqState>
    implements $FaqStateCopyWith<$Res> {
  _$FaqStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? model = freezed,
    Object? failure = freezed,
    Object? faqs = freezed,
    Object? pageLoading = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as FaqModel?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      faqs: freezed == faqs
          ? _value.faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<Faqs>?,
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
abstract class _$$_FaqStateCopyWith<$Res> implements $FaqStateCopyWith<$Res> {
  factory _$$_FaqStateCopyWith(
          _$_FaqState value, $Res Function(_$_FaqState) then) =
      __$$_FaqStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      FaqModel? model,
      Failure? failure,
      List<Faqs>? faqs,
      bool? pageLoading});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_FaqStateCopyWithImpl<$Res>
    extends _$FaqStateCopyWithImpl<$Res, _$_FaqState>
    implements _$$_FaqStateCopyWith<$Res> {
  __$$_FaqStateCopyWithImpl(
      _$_FaqState _value, $Res Function(_$_FaqState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? model = freezed,
    Object? failure = freezed,
    Object? faqs = freezed,
    Object? pageLoading = freezed,
  }) {
    return _then(_$_FaqState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as FaqModel?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      faqs: freezed == faqs
          ? _value._faqs
          : faqs // ignore: cast_nullable_to_non_nullable
              as List<Faqs>?,
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FaqState implements _FaqState {
  const _$_FaqState(
      {required this.status,
      this.model,
      this.failure,
      final List<Faqs>? faqs,
      this.pageLoading})
      : _faqs = faqs;

  @override
  final FormStatus status;
  @override
  final FaqModel? model;
  @override
  final Failure? failure;
  final List<Faqs>? _faqs;
  @override
  List<Faqs>? get faqs {
    final value = _faqs;
    if (value == null) return null;
    if (_faqs is EqualUnmodifiableListView) return _faqs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? pageLoading;

  @override
  String toString() {
    return 'FaqState(status: $status, model: $model, failure: $failure, faqs: $faqs, pageLoading: $pageLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaqState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._faqs, _faqs) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, model, failure,
      const DeepCollectionEquality().hash(_faqs), pageLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FaqStateCopyWith<_$_FaqState> get copyWith =>
      __$$_FaqStateCopyWithImpl<_$_FaqState>(this, _$identity);
}

abstract class _FaqState implements FaqState {
  const factory _FaqState(
      {required final FormStatus status,
      final FaqModel? model,
      final Failure? failure,
      final List<Faqs>? faqs,
      final bool? pageLoading}) = _$_FaqState;

  @override
  FormStatus get status;
  @override
  FaqModel? get model;
  @override
  Failure? get failure;
  @override
  List<Faqs>? get faqs;
  @override
  bool? get pageLoading;
  @override
  @JsonKey(ignore: true)
  _$$_FaqStateCopyWith<_$_FaqState> get copyWith =>
      throw _privateConstructorUsedError;
}
