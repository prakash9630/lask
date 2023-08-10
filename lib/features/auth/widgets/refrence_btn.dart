
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class ReferredBtn extends StatelessWidget {
  const ReferredBtn({Key? key,required this.label,required this.isSelected}) : super(key: key);
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: isSelected?AppColors.primaryColor:AppColors.whiteColor,
            border: Border.all(width: 1,color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 9),
                child: IgnorePointer(
                  ignoring: true,
                  child: Radio(value: true,
                      fillColor:
                      MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return (isSelected)
                                ? AppColors.whiteColor
                                : AppColors.primaryColor;
                          }),                    groupValue: isSelected,
                      activeColor: AppColors.whiteColor,
                      onChanged: (v){}),
                ),
              ),
              textW500S14(label: label,color:isSelected?AppColors.whiteColor:AppColors.primaryColor)
            ],
          ),
        ),
      ],
    );
  }
}
