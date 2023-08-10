import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:lask_client/helper/widit_util/widget_util.dart';

import '../../../core/consts/colors.dart';
import '../model/menu_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageMenu extends StatelessWidget {
  const HomePageMenu({Key? key,required this.menu})
      : super(key: key);
  final MenuItems menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>context.router.push(menu.page),
      child: Card(
          elevation: 5,
          semanticContainer: true,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(menu.icon),
              hSpacer(15.h),
              Text(menu.title,
                  style:  TextStyle(
                      color: AppColors.black2CColor,
                      fontSize: 15.sp, fontWeight: FontWeight.w600))
            ],
          )),
    );
  }
}
