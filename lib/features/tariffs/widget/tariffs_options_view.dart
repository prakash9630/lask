
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/tariffs/model/tariffs_model.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class TariffsOptionsView extends StatelessWidget {
  const TariffsOptionsView({Key? key,required this.isSelected,required this.tariffs}) : super(key: key);
  final bool isSelected;
  final Tariffs tariffs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 9,vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color:isSelected?AppColors.primaryColor: AppColors.containerBorder)
        ),
        child: Stack(
          children: [
            Row(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Radio(value: true, groupValue: isSelected,
                      activeColor: AppColors.primaryColor,
                      onChanged: (v){}),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldPadding(bottomPadding:5,
                        child: textW600S14(label: tariffs.name??"",color: AppColors.black2CColor)),
                    textFieldPadding(
                        bottomPadding: 4,
                        child: textW500S11(label: "Plan Rate")),

                    RichText(
                      text:  TextSpan(
                        text: "€ ${tariffs.price}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600
                        ),
                        children:  [
                          TextSpan(
                            text: "/ ${tariffs.maxMinutes?.toInt()} min",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: AppColors.black2CColor

                            ),
                          )
                        ],
                      ),
                    ),
                  ],),
              ],

            ),
            // const Positioned(
            //   bottom: 0,
            //     right: 0,
            //     child: PopularStatus())
          ],
        ),
      ),
    );
  }
}
