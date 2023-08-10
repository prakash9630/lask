
import 'package:flutter/cupertino.dart';

import '../../../widgets/custom_shimmers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardSimmer extends StatelessWidget {
  const MyCardSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(23.w),
        child: Column(
          children: [
            ...List.generate(3, (index){
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: Column(children: [
                  Row(children: [
                    CustomShimmers.containerShimmer(
                        height: 18.h,
                      width: 160.w
                    ),
                    const Spacer(),
                    CustomShimmers.containerShimmer(
                        height: 18.h,
                        width: 20.w
                    ),
                  ],),
                   SizedBox(height: 15.h,),
                  CustomShimmers.containerShimmer(
                      height: 250.h,
                  ),
                ],),
              );
            })
          ],
        ),
      ),
    );
  }
}
