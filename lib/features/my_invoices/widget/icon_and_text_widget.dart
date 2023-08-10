
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class IconTextWidget extends StatelessWidget {
   IconTextWidget({Key? key,required this.icon,required this.label,this.textColor,this.onTap}) : super(key: key);
  String icon;
  String label;
  Color? textColor;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null) onTap!();
      },
      child: Row(children: [
         SvgPicture.asset(icon),
        const SizedBox(width: 5,),
         textW500S13(label: label,color: textColor)
      ],),
    );
  }
}
