
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class AmountPaidView extends StatelessWidget {
   const AmountPaidView({Key? key,this.onTap,required this.amount,required this.isPaid}) : super(key: key);
 final double amount;
 final bool isPaid;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.primaryColor
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: textW500S12(label: "Total Amount",color: AppColors.whiteColor),
              ),
              textW600S18(label: "€ ${amount.toString()}",color: AppColors.whiteColor)
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: ()=>onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 18),
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: textW500S12(label: isPaid?"COMPLETED":"Not Paid",color: AppColors.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
