import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/notification/model/notification_model.dart';
import 'package:lask_client/features/notification/repo/notification_repo.dart';

import 'notification_state.dart';

final notificationNotifyProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier(ref);
});

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier(this.ref) : super(NotificationState.initial());
  final Ref ref;
  NotificationModel? model;
  List<NotificationsInfo> notificationList = [];

  bool notificationPaginationNotifier(ScrollEndNotification notification){
    if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
      if(model?.next!=null){
        getNotification(url: model?.next);
      }
    }
    return true;
  }

  void getNotification({String? url}) async {
    final response = await ref.read(notificationRepoProvider).getNotification();
    if (url == null) {
      state = response.fold(
          (l) => state.copyWith(
              status: const FormStatus.error(),
              pageLoading: false,
              failure: l), (r) {
        model = NotificationModel.fromJson(r);
        notificationList = model?.notifications ?? [];
        return state.copyWith(
            status: const FormStatus.success(),
            pageLoading: false,
            model: model,
            notifications: notificationList);
      });
    } else {
      state = response.fold((l) => state, (r) {
        return state.copyWith(
            status: const FormStatus.success(),
            pageLoading: true,
            model: model,
            notifications: notificationList);
      });
      state = state.copyWith(pageLoading: false);
    }
  }
}
