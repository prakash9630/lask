import 'package:flutter/cupertino.dart';
import 'package:lask_client/core/consts/colors.dart';

Widget homeTitle({String? label}) {
  return Padding(
    padding: const EdgeInsets.only(left: 23),
    child: Text(
      label ?? "",
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    ),
  );
}

Widget userStatus(bool isOnline) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 1, color:isOnline? AppColors.greenColor:AppColors.red),
    ),
    child:  Center(
      child: Text(isOnline? "Available":"Unavailable",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:isOnline? AppColors.greenColor:AppColors.red),
      ),
    ),
  );
}
