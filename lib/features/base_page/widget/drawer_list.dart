import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/base_page/model/drawer_menu.dart';
import 'package:lask_client/features/base_page/widget/show_share_dialog.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/routes/app_routes.dart';
import '../model/pages_model.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key, required this.menu, this.showArrow,this.pages})
      : super(key: key);
  final DrawerMenu menu;
  final Pages? pages;
  final bool? showArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(menu.page!=null){
          context.pushRoute(menu.page!);
        }else if(pages!=null){
          context.pushRoute(DetailRoute(pages: pages!));
        }
        if(menu.title=="Share App Now"){
          showShareDialog(context: context);
        }
      },
      child: Padding(
        padding:  EdgeInsets.only(left: 20.w,bottom: 20.h,top: 20.h),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if(menu.isNetwork==true && menu.icon!=null)
                SvgPicture.network(menu.icon!,width: 24.w,height: 24.w,)
                else
                SvgPicture.asset(menu.icon??AssetPath.iconAboutUs,color: AppColors.primaryColor,width: 24.w,height: 24.w,),
                wSpacer(20.w),
                Expanded(
                    child: Text(
                      menu.title,
                      style:  TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2CColor),
                    )),
              ],
            ),
            if(showArrow==true)
            Positioned(
              right: 20.w
            ,child: SvgPicture.asset(AssetPath.arrowRight)),
          ],
        ),
      ),
    );
  }
}
