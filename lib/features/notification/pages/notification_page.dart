import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/notification/provider/notification_notifier.dart';
import 'package:lask_client/features/notification/widget/notification_simmer.dart';
import 'package:lask_client/features/notification/widget/notification_view.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../../widgets/custom_sliver_app_bar.dart';
import '../widget/no_notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  int flag = 0;
  @override
  void didChangeDependencies() {
    if (flag == 0) {
      setState(() {
        ref.read(notificationNotifyProvider.notifier).getNotification();
        flag = 1;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final notiProv = ref.watch(notificationNotifyProvider);
    return CustomSliverAppBar(
      title: "Notifications",
      isPageable: true,
      onNotification: ref
          .read(notificationNotifyProvider.notifier)
          .notificationPaginationNotifier,
      onRefresh: () {
        ref.refresh(notificationNotifyProvider.notifier).getNotification();
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 23.w),
        child: notiProv.status.maybeWhen(
            success: () {
              if(notiProv.notifications!.isNotEmpty) {
                return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 22.h),
                    child: textW600S18(
                        label: "All Notifications & Support Messages"),
                  ),
                  ...List.generate(notiProv.notifications!.length, (idx) {
                    return NotificationView(
                      notifications: notiProv.notifications![idx],
                    );
                  }),
                  if (notiProv.pageLoading == true) loadingView()
                ],
              );
              } else{
                 return const NoNotificationView();
              }
            },
          orElse: () => const NotificationSimmer(),
        ),
      ),
    );
  }
}
