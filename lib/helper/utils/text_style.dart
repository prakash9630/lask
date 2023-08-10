import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle myTextStyle(double fontSize, String fontFamily, FontWeight fontWeight,
    Color color, TextDecoration decoration,
    {double? letterSpacing}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      color: color,
      decoration: decoration);
}

TextStyle headingStyle({
  required FontWeight weight,
  required Color color,
}) {
  return myTextStyle(26.sp, "Inter", weight, color, TextDecoration.none);
}

TextStyle subHeadingStyle({
  required FontWeight weight,
  required Color color,
}) {
  return myTextStyle(24.sp, "Inter", weight, color, TextDecoration.none);
}

TextStyle subSubHeadingStyle({
  required FontWeight weight,
  required Color color,
}) {
  return myTextStyle(20.sp, "Inter", weight, color, TextDecoration.none);
}

TextStyle titleStyle({
  required FontWeight weight,
  required Color color,
}) {
  return myTextStyle(18.sp, "Inter", weight, color, TextDecoration.none);
}

TextStyle subTitleStyle({
  required FontWeight weight,
  required Color color,
  TextDecoration? decoration,
  double? letterSpacing,
}) {
  return myTextStyle(
      16.sp, "Inter", weight, color, decoration ?? TextDecoration.none,
      letterSpacing: letterSpacing);
}

TextStyle normalStyle({
  required FontWeight weight,
  required Color color,
  TextDecoration? decoration,
}) {
  return myTextStyle(
      14.sp, "Inter", weight, color, decoration ?? TextDecoration.none);
}
TextStyle normalHeaderStyle({
   FontWeight? weight,
     Color? color,
  TextDecoration? decoration,
}) {
  return myTextStyle(
      18.sp, "Inter", weight??FontWeight.w500, color??AppColors.whiteColor, decoration ?? TextDecoration.none);
}
TextStyle boldHeaderStyle({
  FontWeight? weight,
  Color? color,
  TextDecoration? decoration,
}) {
  return myTextStyle(
      24.sp, "Inter", weight??FontWeight.w600, color??AppColors.whiteColor, decoration ?? TextDecoration.none);
}

TextStyle subNormalStyle({
  required FontWeight weight,
  required Color color,
  TextDecoration? decoration,
}) {
  return myTextStyle(
      12.sp, "Inter", weight, color, decoration ?? TextDecoration.none);
}

TextStyle subSubNormalStyle(
    {required FontWeight weight, required Color color, double? letterSpacing}) {
  return myTextStyle(10.sp, "Inter", weight, color, TextDecoration.none,
      letterSpacing: letterSpacing);
}

TextStyle fontSize11(
    {required FontWeight weight,
    required Color color,
    double? letterSpacing,
    TextDecoration? decoration}) {
  return myTextStyle(
      11.sp, "Inter", weight, color, decoration ?? TextDecoration.none,
      letterSpacing: letterSpacing);
}
