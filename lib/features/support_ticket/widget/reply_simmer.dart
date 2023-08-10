
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_shimmers.dart';

class ReplySimmer extends StatelessWidget {
  const ReplySimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount:6,
        itemBuilder: (_,index){
          return CustomShimmers.containerShimmer(
            height: 100.h,
            showBorder: false,
            margin:  EdgeInsets.only(bottom: 8.0.h),
          );
        });


  }
}
