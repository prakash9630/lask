import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/home_page/model/hompage_model.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

showUserInfoDialog(BuildContext context,
    {Lawyer? lawyer, String? title, String? des}) {
  Widget okButton = TextButton(
    child: textW500S15(label: "Ok", color: AppColors.primaryColor),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: textW600S20(label: title ?? "Offline"),
    content: textW400S13(
        label: des ??
            "${lawyer?.user?.fullName} is offline so you cannot make call right now."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
