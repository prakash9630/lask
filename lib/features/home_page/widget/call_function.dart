import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:lask_client/features/home_page/widget/show_no_internet_dilog.dart';
import 'package:lask_client/features/home_page/widget/show_user_offline_dialogue.dart';
import '../../../core/routes/app_routes.dart';
import '../../../helper/utils/app_utils.dart';
import '../../tariffs/widget/tariffs_dialogue.dart';
import '../model/hompage_model.dart';

Future<void> onDirectCall(BuildContext context, {required Lawyer lawyers,int? voucherId}) async {
  if(lawyers.lawyerOnline==true){
    if (await isInternetConnected()) {
      if (context.mounted) {
        if(voucherId!=null){
          context.router.push(CallRoute(lawyers: lawyers,giftVoucherId: voucherId));
        }else{
          showTariffDialog(context,
              onConfirmPlan:(plan) async {
                plan.dialogContext.popRoute();
                context.router.push(CallRoute(lawyers: lawyers, tariffsId: plan.tariffs.id!));
              });
        }
      }
    } else {
      if (context.mounted) {
        showNoInternetDialog(context);
      }
    }
  }else
  {
    showUserInfoDialog(context,lawyer: lawyers);
  }
}

