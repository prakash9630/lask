import 'package:flutter/material.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class VerifyingPaymentPage extends StatelessWidget {
  const VerifyingPaymentPage({Key? key,required this.verifyFail,this.onRetry}) : super(key: key);
  final bool verifyFail;
  final Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textW600S18(label: "Verifying payment ..."),
            if(verifyFail)
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CustomButton(onPressed: onRetry, label: "Retry",
                width: 180,),
              )
            else
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
