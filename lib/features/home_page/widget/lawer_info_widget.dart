import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/home_page/widget/widget_collections.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/colors.dart';
import '../../../widgets/custom_static_ratings.dart';
import '../model/hompage_model.dart';
import 'call_function.dart';
import 'home_call_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LawyerInfoWidget extends StatelessWidget {
  const LawyerInfoWidget({Key? key, this.lawyers, this.purpose,this.voucherId})
      : super(key: key);
  final Lawyer? lawyers;
  final String? purpose;
  final int? voucherId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(LawyersDetailRoute(lawyer: lawyers!)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Card(
          elevation: 0.5,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Container(
            padding:  EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 1),
              borderRadius:  BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: lawyers?.user?.userImage ?? "",
                                height: 75.w,
                                width: 75.w,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) {
                                  return CircleAvatar(
                                      backgroundColor: AppColors.primaryColor
                                          .withOpacity(0.7),
                                      radius: 50.0.r,
                                      child:  Icon(
                                        Icons.person,
                                        color: AppColors.whiteColor,
                                        size: 40.r,
                                      ));
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 5.h,
                              right: 5.w,
                              child: Container(
                                height: 13.h,
                                width: 13.w,
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(100.r)),
                                child: Center(
                                  child: Container(
                                    height: 10.h,
                                    width: 10.w,
                                    decoration: BoxDecoration(
                                        color: lawyers?.lawyerOnline == true
                                            ? AppColors.greenColor
                                            : AppColors.red,
                                        borderRadius:
                                            BorderRadius.circular(100.r)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        hSpacer(10.h),
                        userStatus(lawyers?.lawyerOnline ?? false)
                      ],
                    ),
                    wSpacer(15.w),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lawyers?.user?.fullName ?? "",
                          style:  TextStyle(
                              color: AppColors.black2CColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        hSpacer(8),
                        RichText(
                          text: TextSpan(
                            text: "License ID :  ",
                            style:  TextStyle(
                                color: AppColors.lightGrey,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                text: lawyers?.licenseNumber ?? "",
                                style:  TextStyle(
                                    color: AppColors.black2CColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        hSpacer(8.h),
                          RichText(
                            text: TextSpan(
                              text: "Cases Handled in Lask : ",
                              style:  TextStyle(
                                  color: AppColors.lightGrey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "${lawyers?.totalCalls ?? "0"}",
                                  style:  TextStyle(
                                      color: AppColors.black2CColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        if (purpose != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: RichText(
                              text: TextSpan(
                                text: "Purpose of call last time :  ",
                                style:  TextStyle(
                                    color: AppColors.lightGrey,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: purpose ?? "",
                                    style: TextStyle(
                                        color: AppColors.black2CColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ))
                  ],
                ),
                hSpacer(15.h),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Divider(
                    height: 2.h,
                    color: AppColors.borderColor,
                  ),
                ),
                hSpacer(15.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Lawyers Rating :  ",
                            style:  TextStyle(
                                color: AppColors.lightGrey,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                text: lawyers?.rating.toString() ?? "0",
                                style: TextStyle(
                                    color: AppColors.black2CColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        wSpacer(6.w),
                        Row(
                          children: [
                            CustomStaticRating(
                              initialRaging: double.parse(
                                  lawyers?.rating.toString() ?? "0"),
                              ignoreGesture: true,
                            ),
                            wSpacer(8.w),
                            if(lawyers!.numberOfRating! > 10)
                              Text(
                              "(${lawyers?.numberOfRating} Ratings)",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightGrey),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    HomeCallBtn(
                      onTap: () async {
                       await onDirectCall(context, lawyers: lawyers!,voucherId: voucherId);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
