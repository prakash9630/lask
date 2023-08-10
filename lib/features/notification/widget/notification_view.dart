import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/notification/model/notification_model.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../../util/date_format.dart';
import '../../../widgets/custom_cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key, required this.notifications})
      : super(key: key);

  final NotificationsInfo notifications;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 25.h, bottom: 10.h),
            child: textW500S14(
                label: notifications.notification?.title ?? "",
                color: AppColors.black2CColor),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 10.0.h),
            child: Html(data: notifications.notification?.description ?? "",
              style: {
                "body": Style(
                    fontSize: FontSize(12.sp),
                    fontWeight: FontWeight.w400,
                    maxLines: 3,
                    color: AppColors.fontGrey
                ),
              },
            ),
          ),
          if(notifications.notification?.image!=null)
          Padding(
            padding:  EdgeInsets.only(bottom: 13.h),
            child: SizedBox(
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
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textW500S12(label: dateTimeFormat(notifications.notification?.createdAt ?? "")),
              TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerRight),
                  onPressed: () {
                    context.router.push(
                        NotificationDetailRoute(notifications: notifications));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textW500S12(
                          label: "SEE DETAILS", color: AppColors.primaryColor),
                       SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ))
            ],
          ),
           Divider(
            color: AppColors.containerBorder,
            thickness: 1.0.h,
          )
        ],
      ),
    );
  }
}
