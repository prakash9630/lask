
import 'package:flutter/material.dart';
import 'package:lask_client/widgets/custom_shimmers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
       shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return CustomShimmers.containerShimmer(
            height: 200.h
          );
        },
        separatorBuilder: (context,index){
          return  SizedBox(height: 15.h,);
        },
        itemCount: 3);
  }
}
