

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_shimmers.dart';

class ServicesShimmer extends StatelessWidget {
  const ServicesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomShimmers.containerShimmer(
        height: 50.h
      ),
       SizedBox(height: 25.h,),
      ...List.generate(7, (index) =>
          Padding(
            padding:  EdgeInsets.only(bottom: 10.0.h),
            child: CustomShimmers.containerShimmer(height: 90.h),
          )
      )

    ],);
  }
}
