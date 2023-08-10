import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class StatusView extends StatelessWidget {
  const StatusView({Key? key,required this.isOnline}) : super(key: key);
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 25,
        width: 84,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: isOnline? AppColors.greenColor:AppColors.red),
        child:  Center(
          child: textW500S12(label:isOnline? "Available":"Unavailable",
              color:AppColors.whiteColor )
        ),
      ),
    );
  }
}
