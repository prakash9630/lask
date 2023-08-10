import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/home_page/widget/call_function.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../helper/utils/app_utils.dart';
import '../../../widgets/custom_static_ratings.dart';
import '../../home_page/model/hompage_model.dart';
import '../widget/status_view.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LawyersDetailPage extends StatelessWidget {
  const LawyersDetailPage({Key? key, required this.lawyer}) : super(key: key);
  final Lawyer lawyer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  CachedNetworkImage(
                    imageUrl: lawyer.user?.userImage ?? "",
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        AssetPath.logoWithTitle,
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                  // Image.asset(AssetPath.lawyerDetailFeatureImg),
                  Positioned(
                      left: 23.w,
                      top: 50.h,
                      child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(AssetPath.iconBackWhite)))
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 23.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusView(
                    isOnline: lawyer.lawyerOnline ?? false,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 12.h),
                    child: textW600S20(
                      label: lawyer.user?.fullName ?? "",
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 15.h),
                    child: textW400S14(
                      label: services(lawyer.services ?? []) ?? "",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: 5.h),
                              child: textW500S14(label: "License ID"),
                            ),
                            textW500S14(
                                label: lawyer.licenseNumber ?? "",
                                color: AppColors.black2CColor),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(right: 5.w),
                                  child: CustomStaticRating(
                                    initialRaging:
                                        lawyer.rating?.toDouble() ?? 0,
                                    ignoreGesture: true,
                                  ),
                                ),
                                textW500S14(
                                    label: lawyer.rating.toString(),
                                    color: AppColors.black2CColor),
                              ],
                            ),
                             SizedBox(
                              height: 5.h,
                            ),
                            if(lawyer.numberOfRating! > 10)
                            textW500S12(
                                label:
                                    "(${lawyer.numberOfRating ?? "0"} Ratings)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 12.w),
                        child: SvgPicture.asset(AssetPath.iconLaw),
                      ),
                      textW400S14(
                          label:
                              "${lawyer.totalCalls ?? 0} cases handled in Lask")
                    ],
                  ),
                   SizedBox(
                    height: 22.h,
                  ),
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding:  EdgeInsets.only(right: 12.w),
                  //       child: SvgPicture.asset(AssetPath.iconLaw),
                  //     ),
                  //     textW400S14(
                  //         label:
                  //             "${lawyer.experience ?? 0} years of Experience")
                  //   ],
                  // ),
                   SizedBox(
                    height: 75.h,
                  ),
                  CustomButton(
                    onPressed: () async {
                     // await onCall(context, lawyers: lawyer);
                      await onDirectCall(context, lawyers: lawyer);

                    },
                    label: "Call Lawyer Now",
                    leadingIcon:  Iconify(
                      Ph.phone_call,
                      color: AppColors.whiteColor,
                      size: 19.r,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
