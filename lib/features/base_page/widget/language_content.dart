
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/consts/colors.dart';
import '../model/language_model.dart';

class LanguageContent extends StatelessWidget {
  const LanguageContent({Key? key,required this.lang,required this.isSelected}) : super(key: key);
 final LanguageModel lang;
 final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 29.h,
      decoration: BoxDecoration(
          color: isSelected?AppColors.primaryColor:AppColors.whiteColor,
          borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(lang.index==0?9:0),
              bottomLeft: Radius.circular(lang.index==0?9:0),
              topRight:Radius.circular(lang.index==0?0:9),
              bottomRight: Radius.circular(lang.index==0?0:9)),
          border: Border.all(
              width: 1.w, color: AppColors.primaryColor)),
      child:  Center(
        child: Text(
          lang.label,
          style:  TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Inter",
              color: isSelected?AppColors.whiteColor:AppColors.primaryColor),
        ),
      ),
    );
  }
}
