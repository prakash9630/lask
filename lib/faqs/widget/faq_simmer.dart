
import 'package:flutter/material.dart';
import 'package:lask_client/widgets/custom_shimmers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqSimmer extends StatelessWidget {
  const FaqSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomShimmers.containerShimmer(
        height: 25.h,

      ),
      const SizedBox(height: 5,),
      CustomShimmers.containerShimmer(
        height: 25.h,
        width: 250.w,
      ),
       SizedBox(height: 10.h,),
      ...List.generate(3, (index) =>  Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: CustomShimmers.containerShimmer(
          height: 15.h,
        ),
      ),),
       SizedBox(height: 25.h,),
      ...List.generate(6, (index) =>
          Padding(
            padding:  EdgeInsets.only(bottom: 15.h),
            child: CustomShimmers.containerShimmer(
              height: 90.h,
            ),
          ),)

    ],);
  }
}
