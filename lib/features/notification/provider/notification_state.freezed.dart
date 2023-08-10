// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationState {
  FormStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool? get pageLoading => throw _privateConstructorUsedError;
  NotificationModel? get model => throw _privateConstructorUsedError;
  List<NotificationsInfo>? get notifications =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      bool? pageLoading,
      NotificationModel? model,
      List<NotificationsInfo>? notifications});

  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? pageLoading = freezed,
    Object? model = freezed,
    Object? notifications = freezed,
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
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NotificationModel?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationsInfo>?,
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
abstract class _$$_NotificationStateCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$_NotificationStateCopyWith(_$_NotificationState value,
          $Res Function(_$_NotificationState) then) =
      __$$_NotificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormStatus status,
      Failure? failure,
      bool? pageLoading,
      NotificationModel? model,
      List<NotificationsInfo>? notifications});

  @override
  $FormStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_NotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$_NotificationState>
    implements _$$_NotificationStateCopyWith<$Res> {
  __$$_NotificationStateCopyWithImpl(
      _$_NotificationState _value, $Res Function(_$_NotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? pageLoading = freezed,
    Object? model = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_$_NotificationState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      pageLoading: freezed == pageLoading
          ? _value.pageLoading
          : pageLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NotificationModel?,
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationsInfo>?,
    ));
  }
}

/// @nodoc

class _$_NotificationState implements _NotificationState {
  const _$_NotificationState(
      {required this.status,
      this.failure,
      this.pageLoading,
      this.model,
      final List<NotificationsInfo>? notifications})
      : _notifications = notifications;

  @override
  final FormStatus status;
  @override
  final Failure? failure;
  @override
  final bool? pageLoading;
  @override
  final NotificationModel? model;
  final List<NotificationsInfo>? _notifications;
  @override
  List<NotificationsInfo>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NotificationState(status: $status, failure: $failure, pageLoading: $pageLoading, model: $model, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.pageLoading, pageLoading) ||
                other.pageLoading == pageLoading) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure, pageLoading,
      model, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationStateCopyWith<_$_NotificationState> get copyWith =>
      __$$_NotificationStateCopyWithImpl<_$_NotificationState>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {required final FormStatus status,
      final Failure? failure,
      final bool? pageLoading,
      final NotificationModel? model,
      final List<NotificationsInfo>? notifications}) = _$_NotificationState;

  @override
  FormStatus get status;
  @override
  Failure? get failure;
  @override
  bool? get pageLoading;
  @override
  NotificationModel? get model;
  @override
  List<NotificationsInfo>? get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationStateCopyWith<_$_NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
