
import 'package:flutter/material.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../core/consts/colors.dart';


void showWarningTimeOutDialog(BuildContext context,
    {required Function(BuildContext ctx)  onRecharge,required Function(BuildContext ctx) onCancel}){
  showDialog(
    context: context,
    builder: (context) => WarningTimeOutDialog(onPressed: onRecharge, onCancel: onCancel,)
  );
}
class WarningTimeOutDialog extends StatelessWidget {
  const WarningTimeOutDialog({
    Key? key,
    required this.onPressed,
    required this.onCancel,
  }) : super(key: key);

  final Function(BuildContext ctx)  onPressed;
  final Function(BuildContext ctx) onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: textW600S20(label: "Time out warning!",color: AppColors.red),
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffC5BFBF),
          ),
        ],
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You have only 2 minus call left please recharge to continue calling",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: AppColors.primaryColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: (){
             onCancel(context);
    },
          child: const Text(
            'CANCEL',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            onPressed(context);
          },
          child: const Text(
            "Recharge",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
