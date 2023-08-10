import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/asset_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCallBtn extends StatelessWidget {
  const HomeCallBtn({Key? key,required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
      child: Container(
        padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 18.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.primaryColor),
        child: Center(
          child: Row(
            children:  [
              SvgPicture.asset(AssetPath.iconCall),
              wSpacer(8.w),
               Text(
                "Call Lawyer",
                style: TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 12.sp,color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
