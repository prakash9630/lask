// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replays_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReplaysState {
  FormStatus get status => throw _privateConstructorUsedError;
  bool get pageLoading => throw _privateConstructorUsedError;
  SupportTicketReplyMeta? get model => throw _privateConstructorUsedError;
  List<SupportTicketReplyModel>? get replyList =>
      throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReplaysStateCopyWith<ReplaysState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplaysStateCopyWith<$Res> {
  factory $ReplaysStateCopyWith(
          ReplaysState value, $Res Function(ReplaysState) then) =
      _$ReplaysStateCopyWithImpl<$Res, ReplaysState>;
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      SupportTicketReplyMeta? model,
      List<SupportTicketReplyModel>? replyList,
      Failure? failure});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ReplaysStateCopyWithImpl<$Res, $Val extends ReplaysState>
    implements $ReplaysStateCopyWith<$Res> {
  _$ReplaysStateCopyWithImpl(this._value, this._then);

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
    Object? replyList = freezed,
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
              as SupportTicketReplyMeta?,
      replyList: freezed == replyList
          ? _value.replyList
          : replyList // ignore: cast_nullable_to_non_nullable
              as List<SupportTicketReplyModel>?,
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
abstract class _$$_ReplaysStateCopyWith<$Res>
    implements $ReplaysStateCopyWith<$Res> {
  factory _$$_ReplaysStateCopyWith(
          _$_ReplaysState value, $Res Function(_$_ReplaysState) then) =
      __$$_ReplaysStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      bool pageLoading,
      SupportTicketReplyMeta? model,
      List<SupportTicketReplyModel>? replyList,
      Failure? failure});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_ReplaysStateCopyWithImpl<$Res>
    extends _$ReplaysStateCopyWithImpl<$Res, _$_ReplaysState>
    implements _$$_ReplaysStateCopyWith<$Res> {
  __$$_ReplaysStateCopyWithImpl(
      _$_ReplaysState _value, $Res Function(_$_ReplaysState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pageLoading = null,
    Object? model = freezed,
    Object? replyList = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_ReplaysState(
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
              as SupportTicketReplyMeta?,
      replyList: freezed == replyList
          ? _value._replyList
          : replyList // ignore: cast_nullable_to_non_nullable
              as List<SupportTicketReplyModel>?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_ReplaysState implements _ReplaysState {
  const _$_ReplaysState(
      {required this.status,
      required this.pageLoading,
      this.model,
      final List<SupportTicketReplyModel>? replyList,
      this.failure})
      : _replyList = replyList;

  @override
  final FormStatus status;
  @override
  final bool pageLoading;
  @override
  final SupportTicketReplyMeta? model;
  final List<SupportTicketReplyModel>? _replyList;
  @override
  List<SupportTicketReplyModel>? get replyList {
    final value = _replyList;
    if (value == null) return null;
    if (_replyList is EqualUnmodifiableListView) return _replyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ReplaysState(status: $status, pageLoading: $pageLoading, model: $model, replyList: $replyList, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplaysState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality()
                .equals(other._replyList, _replyList) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, pageLoading, model,
      const DeepCollectionEquality().hash(_replyList), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplaysStateCopyWith<_$_ReplaysState> get copyWith =>
      __$$_ReplaysStateCopyWithImpl<_$_ReplaysState>(this, _$identity);
}

abstract class _ReplaysState implements ReplaysState {
  const factory _ReplaysState(
      {required final FormStatus status,
      required final bool pageLoading,
      final SupportTicketReplyMeta? model,
      final List<SupportTicketReplyModel>? replyList,
      final Failure? failure}) = _$_ReplaysState;

  @override
  FormStatus get status;
  @override
  bool get pageLoading;
  @override
  SupportTicketReplyMeta? get model;
  @override
  List<SupportTicketReplyModel>? get replyList;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_ReplaysStateCopyWith<_$_ReplaysState> get copyWith =>
      throw _privateConstructorUsedError;
}
