
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class RechargeHoldView extends StatelessWidget {
  const RechargeHoldView({Key? key,this.showMsgIcon, this.onTap,this.iconPath,this.label,this.color}) : super(key: key);
  final VoidCallback? onTap;
  final String? iconPath;
  final String? label;
  final bool? showMsgIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null)onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color:color??AppColors.deemBlue.withOpacity(0.9)
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Stack(
                    children: [
                      SvgPicture.asset(iconPath??AssetPath.holdIcon),
                       if(showMsgIcon==true)
                      Positioned(
                        bottom: 0,
                          right: 0,
                          child: SvgPicture.asset(AssetPath.msgIcon,height: 20,)),
                    ],
                  ),
                ),
                Expanded(child: textW600S16(label: label?? "Recharge on hold")),
              ],
            ),
            Positioned(
              top: 0,
                bottom: 0,
                right: 18,
                child: SvgPicture.asset(AssetPath.arrowRight))
          ],
        )
      ),
    );
  }
}
