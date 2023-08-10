import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lask_client/core/consts/colors.dart';
import '../../../core/consts/asset_path.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../../util/date_format.dart';
import '../../../widgets/custom_cached_image.dart';
import '../../../widgets/custom_sliver_app_bar.dart';
import '../model/notification_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NotificationDetailPage extends StatelessWidget {
  const NotificationDetailPage({Key? key, required this.notifications})
      : super(key: key);
  final NotificationsInfo notifications;

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      title: "Notification Detail",
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 23.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 22.h, bottom: 15.h),
              child: textW500S16(
                  label: notifications.notification?.title ?? "",
                  color: AppColors.black2CColor),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 10.h),
              child: textW500S12(
                  label: dateTimeFormat(notifications.notification?.createdAt ?? "")),
            ),
            if(notifications.notification?.image!=null)
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.404,
              width: MediaQuery.of(context).size.width - 46,
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CustomCachedImage(
                    showFullImage: true,
                    imageUrl: notifications.notification?.image ?? "",
                    fit: BoxFit.cover,
                    errorImage: AssetPath.appTitle,
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 15.0.h, bottom: 10.h),
              child: Html(data: notifications.notification?.description ?? "",
                style: {
                  "body": Style(
                    fontSize: FontSize(12.sp),
                    fontWeight: FontWeight.w400,
                    color: AppColors.fontGrey
                  ),

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
