import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lask_client/helper/utils/text_style.dart';
import 'package:lottie/lottie.dart';

import '../../core/consts/asset_path.dart';
import '../../core/consts/colors.dart';

loading({bool visible=true}) {
  if(visible){
    BotToast.showLoading(
        backgroundColor: Colors.black.withOpacity(0.5), align: Alignment.center);
    return Container(
      color: AppColors.blackColor.withOpacity(0.6),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              )),
          Lottie.asset(AssetPath.loading, width: 50, height: 50),
        ],
      ),
    );
  }else{
    return BotToast.closeAllLoading();
  }

}

showToast({required String text, Color? color}) {
  return BotToast.showText(
      text: text,
      clickClose: true,
      contentColor: AppColors.greenColor,
      textStyle:
          normalStyle(weight: FontWeight.w600, color: AppColors.whiteColor));
}
showErrorToast({required String text, Color? color}) {
  return BotToast.showText(
      text: text,
      clickClose: true,
      contentColor: color ?? Colors.red,
      textStyle:
      normalStyle(weight: FontWeight.w600, color: AppColors.whiteColor));
}

customToast({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0);
}
