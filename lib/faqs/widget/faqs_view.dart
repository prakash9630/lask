import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lask_client/faqs/model/faq_model.dart';

import '../../core/consts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({Key? key, required this.index,required this.faqs}) : super(key: key);
  final int index;
  final Faqs faqs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 12.0.h),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.extraLightBlue,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
          ),
          childrenPadding:
           EdgeInsets.symmetric(
            horizontal: 10.0.w,
          ),
          iconColor: AppColors.primaryColor,
          collapsedIconColor: AppColors.primaryColor,
          title: Html(data: "${index + 1}. ${faqs.question}",
            style: {
              "body": Style(
                fontSize: FontSize(14.sp),
                fontWeight: FontWeight.w500,
              ),
            },),
          // title: textW500S14(
          //     label:
          //         "${index + 1}. ${faqs.question}",
          //     color: AppColors.black2CColor),
          children: [
            Html(data: faqs.answer??"",)
            // textW400S14(
            //     label: faqs.answer??"")
          ],
        ),
      ),
    );
  }
}
