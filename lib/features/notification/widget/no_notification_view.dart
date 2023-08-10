import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/widgets/empty_page_btn.dart';
import '../../../core/consts/colors.dart';
import '../../../helper/widit_util/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNotificationView extends StatelessWidget {
  const NoNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 150.h, bottom: 30.h),
          child: Image.asset(AssetPath.emptyNotification),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 25.h),
          child: textW500S15(label: 'Your notification is empty currently!',color: AppColors.lightGreyColor),
        ),
        EmptyPageBtn(onTap: () {
          context.router.pop();
        })
      ],
    );
  }
}
