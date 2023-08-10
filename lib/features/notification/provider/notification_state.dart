
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/notification/model/notification_model.dart';
part 'notification_state.freezed.dart';
@freezed
class NotificationState with _$NotificationState{
  const factory NotificationState({
    required FormStatus status,
    Failure? failure,
    bool? pageLoading,
    NotificationModel? model,
    List<NotificationsInfo>? notifications

})=_NotificationState;

  factory NotificationState.initial({
    FormStatus status=const FormStatus.initial(),

})=>NotificationState(status: status);
}