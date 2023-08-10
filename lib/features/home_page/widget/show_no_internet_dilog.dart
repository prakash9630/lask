
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

showNoInternetDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: textW500S15(label: "Ok",color: AppColors.primaryColor),
      onPressed: () {
        context.router.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: textW600S20(label: "No Internet Connection"),
      content:textW400S13(label: "You need to connected to internet to make a call."),
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

  
