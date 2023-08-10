
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_shimmers.dart';

class SupportSimmer extends StatelessWidget {
  const SupportSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        ...List.generate(6, (index){
      return Padding(
        padding:  EdgeInsets.only(bottom: 20.0.h,left: 23,right: 23,top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomShimmers.containerShimmer(width: 120.w, height: 16.h),
            const SizedBox(
              height: 6,
            ),
            CustomShimmers.containerShimmer(width: 60.w, height: 12.h),
          ],
        ),
      );
        })
      ],
    );

  }
}
