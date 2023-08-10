import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget hSpacer(double? height) {
  return SizedBox(
    height: height ?? 5.h,
  );
}

Widget wSpacer(double? width) {
  return SizedBox(
    width: width ?? 5.w,
  );
}

Widget loadingView() {
  return SizedBox(
    height: 20.h,
    child: const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    ),
  );
}

Widget textFieldPadding({required Widget child, double? bottomPadding}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomPadding ?? 15.h),
    child: child,
  );
}

showBotDialog(String title, String des) {
  BotToast.showWidget(toastBuilder: (cancel) {
    return AlertDialog(
      title: textW600S20(label: title),
      content: textW400S13(label: des),
      actions: [
        TextButton(
          child: textW500S15(label: "Ok", color: AppColors.primaryColor),
          onPressed: () {
            BotToast.cleanAll();
          },
        )
      ],
    );
  });
}

Widget textW600S20({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
        color: color ?? AppColors.headerBlack),
  );
}

Widget textW600S18({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW500S26({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 26.sp,
        color: color ?? AppColors.whiteColor),
  );
}

Widget textW400S14({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW400S16({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW400S18({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
        color: color ?? AppColors.whiteColor),
  );
}

Widget textW400S12({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        color: color ?? AppColors.fontGrey),
  );
}

Widget textW500S14({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: color ?? AppColors.greyColor),
  );
}

Widget textW500S15({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW500S12({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: color ?? AppColors.lightGreyColor),
  );
}

Widget textW500S11({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11.sp,
        color: color ?? AppColors.lightGreyColor),
  );
}

Widget textW500S16({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: color ?? AppColors.whiteColor),
  );
}

Widget textW500S8({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 8.sp,
        color: color ?? AppColors.whiteColor),
  );
}

Widget textW500S13({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW500S10({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 10.sp,
        color: color ?? AppColors.lightGreyColor),
  );
}

Widget textW600S16({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW600S14({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: color ?? AppColors.lightGreyColor),
  );
}

Widget textW600S13({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 13.sp,
        color: color ?? AppColors.lightRed),
  );
}

Widget textW600S12({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW600S15({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
        color: color ?? AppColors.black2CColor),
  );
}

Widget textW400S13({required String label, Color? color}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13.sp,
        color: color ?? AppColors.black2CColor),
  );
}
