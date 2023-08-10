import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/utils/app_utils.dart';
import '../model/invoice_model.dart';

class InvoicePaymentInfoView extends StatelessWidget {
  const InvoicePaymentInfoView({Key? key,required this.invoices}) : super(key: key);
  final Invoices invoices;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: AppColors.containerBorder, width: 1.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldPadding(
            child: textW600S14(label: "Payment Information"),
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(right: 12.w),
                child: SvgPicture.asset(AssetPath.callBlue),
              ),
              Expanded(
                child: textW600S15(
                    label:
                        invoices.call?.service??""),
              )
            ],
          ),
           SizedBox(
            height: 15.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: shortInfo(
                    iconPath: AssetPath.moneyIcon,
                    key: "Fee Amount",
                    value: "€ ${invoices.amount}"),
              ),
              Expanded(
                flex: 1,
                child: shortInfo(
                    iconPath: AssetPath.durationIcon,
                    key: "Duration of call",
                    value:formatDuration(invoices.call!.duration!.toInt())),
              )
            ],
          ),
           SizedBox(
            height: 15.h,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: shortInfo(
                    iconPath: AssetPath.moneyIcon,
                    key: "Total Fee (in words)",
                    value: "${NumberToWordsEnglish.convert(invoices.amount?.toInt()??0).toUpperCase()} EURO"),
              ),
              Expanded(
                flex: 1,
                child: shortInfo(
                    iconPath: AssetPath.moneyIcon,
                    key: "Tariff",
                    value: invoices.tariffData?.tariffName,
              ),)
            ],
          ),
           SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }

  Widget shortInfo(
      {required String iconPath, required String key, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(right: 12.w),
          child: SvgPicture.asset(iconPath),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 7.0.h),
                child: textW500S13(label: key, color: AppColors.fontGrey),
              ),
              textW600S15(label: value ?? "")
            ],
          ),
        ),
      ],
    );
  }
}
