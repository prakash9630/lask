
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/helper/utils/app_utils.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/colors.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../model/profile_menu_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileMenuView extends StatelessWidget {
   const ProfileMenuView({Key? key,required this.menu}) : super(key: key);
    final ProfileMenuModel menu;

  @override
  Widget build(BuildContext context) {
   return  InkWell(
     onTap: (){
       if(menu.title=="Logout"){
         showDialog(
           context: context,
           builder: (context) => CustomAlertDialog(
             label: "Are you sure you want to logout?",
             onPressed: (){
               context.router.popAndPush(const LoginRoute());
               appClear();
             },
             btnText: "Log out",
           ),
         );
       }else{
         context.router.push(menu.page);
       }
     },
     child: Padding(
       padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 5.h),
       child: Stack(
          children: [
        Row(children: [
       SvgPicture.asset(menu.iconPath),
          SizedBox(width: 20.w,),
        textW500S16(label: menu.title,color: AppColors.black2CColor)
        ],),
            Positioned(
              right: 0.w,
                top: 0.h,
                bottom: 0.h,
                child: SvgPicture.asset(AssetPath.arrowRight))
          ],
        ),
     ),
   );

  }
}
