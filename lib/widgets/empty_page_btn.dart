
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import '../helper/widit_util/widget_util.dart';

class EmptyPageBtn extends StatelessWidget {
  const EmptyPageBtn({Key? key,this.showIcon=true, this.label,required this.onTap}) : super(key: key);
  final bool showIcon;
  final String? label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primaryColor)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 22),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(showIcon)
                const Padding(
                  padding: EdgeInsets.only(right: 7.0),
                  child: Iconify(MaterialSymbols.arrow_back_rounded,color: AppColors.primaryColor,),
                ),
              textW500S14(label: label??"Go Back",color: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
