import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/gift_vouchers/model/voucher_model.dart';
import 'package:lask_client/features/home_page/model/hompage_model.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/routes/app_routes.dart';
import '../../../util/date_format.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_alert_dialog.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({Key? key,required this.vouchers}) : super(key: key);
  final Vouchers vouchers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 15.0.h),
      child: Container(
        padding:  EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.w,color: AppColors.containerBorder)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.only(right: 15.0.w),
                child: Image.asset(AssetPath.voucherImg),
              ),
               Expanded(child: textW500S13(label: vouchers.name??"",color: AppColors.blackColor))
            ],),
             SizedBox(height: 11.h,),
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 4.0.h),
                    child: textW500S10(label: "Expires"),
                  ),
                  textW500S12(label: convertedDate(vouchers.expiryDate),color: AppColors.black2CColor)
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  if(vouchers.isUsed==false && vouchers.id!=null){
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        key: key,
                        label:
                        "Are you sure, you want to call using gift voucher?",
                        onPressed: () {
                          context.router.push(OurServicesRoute(voucherId: vouchers.id));
                        },
                        btnText: "Yes",
                      ),
                    );
                  }
                },
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                  decoration: BoxDecoration(
                    color: vouchers.isUsed==true?AppColors.lightGreyColor:AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: textW500S14(label: "Use Now",color: AppColors.whiteColor),
                ),
              )
            ],),
          ],
        ),
      ),
    );
  }
}
