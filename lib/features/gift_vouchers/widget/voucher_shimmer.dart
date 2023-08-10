
import 'package:flutter/cupertino.dart';
import 'package:lask_client/widgets/custom_shimmers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoucherSimmer extends StatelessWidget {
  const VoucherSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        padding:  EdgeInsets.only(top: 25.h),
        itemCount: 5
        ,itemBuilder: (context,index){
      return Padding(
        padding:  EdgeInsets.all(7.w),
        child: CustomShimmers.containerShimmer(
          height: 123.h,
        ),
      );
    });
  }
}
