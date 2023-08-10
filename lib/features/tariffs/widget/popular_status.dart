import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class PopularStatus extends StatelessWidget {
  const PopularStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: textW500S12(label: "popular",color: AppColors.whiteColor),
    );
  }
}
