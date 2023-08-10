import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/our_services/model/service_model.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../home_page/widget/home_call_btn.dart';
import '../../tariffs/widget/tariffs_dialogue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key,required this.services,this.voucherId}) : super(key: key);
 final Services services;
 final int? voucherId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 10.h),
      child: InkWell(
        onTap: (){
          context.router.push(MyLawyerRoute(serviceId: services.id,voucherId: voucherId));
        },
        child: Container(
          padding:EdgeInsets.all(5.w),
          decoration:  BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.containerBorder),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                       borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                        imageUrl:
                            services.image??"",
                      width: 102.w,
                      placeholder: (context,url){
                          return const CircularProgressIndicator();
                      },
                      errorWidget: (context,url,error){
                          return Image.asset(AssetPath.logoWithTitle);
                      },
                      height: 84.h,),
                  ),
                   wSpacer(15.w),
                    Expanded(child: textW500S14(label: services.name??"",color: AppColors.black2CColor))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HomeCallBtn(
                    onTap: () async {
                      if(voucherId!=null){
                        context.router.push(CallRoute(serviceId: services.id,giftVoucherId: voucherId));
                      }else{
                        showTariffDialog(context,
                            onConfirmPlan:(plan) async {
                              plan.dialogContext.popRoute();
                              context.router.push(CallRoute(serviceId: services.id,tariffsId: plan.tariffs.id!));
                            });
                      }
                      },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
