
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class ReceiptTableView extends StatelessWidget {
  const ReceiptTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(9),
          2: FlexColumnWidth(5),
        },
        border: TableBorder.all(
          width: 1,
          color: AppColors.whiteColor,
        ),
        children:  [
          buildRow(["SN","Particular","Free Amount \n (Euro)"],color: AppColors.primaryColor,textColor: AppColors.whiteColor),
           TableRow(
              children: [
                TableCell(child: Center(child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: textW500S12(label: "1.",color: AppColors.black2CColor),
                ))),
                TableCell(child: Center(child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: textW500S12(label: "Lawyer / Solicitor online Information, Suggestion and Advice.",color: AppColors.black2CColor),
                      ),
                      textW500S12(label: "Duration of Call: 5 mins 44 secs",color: AppColors.primaryColor),

                    ],
                  ),
                ))),
                TableCell(child: Center(child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: textW500S12(label: "20",color: AppColors.black2CColor),
                ))),
              ]
          ),
           TableRow(
              children: [
                const TableCell(child: Center(child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(""),
                ))),
                TableCell(child: Center(child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: textW600S12(label: "Total fare in words",color: AppColors.black2CColor),
                ))),
                 TableCell(child: Center(child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: textW600S12(label: "Twenty Euro",color: AppColors.black2CColor),
                ))),
              ]
          ),


        ],
      ),
    );
  }


  TableRow buildRow(List<String> cells,{Color? color,double? height,Color? textColor}){
    return TableRow(
      children: cells.map((e) => Container(
        height: height??39,
        decoration: BoxDecoration(
            color: color??AppColors.primaryColor.withOpacity(0.07),
           borderRadius: BorderRadius.only(topLeft:Radius.circular(cells.indexOf(e)==0?10:0),topRight: Radius.circular(cells.indexOf(e)==2?10:0))
        ),
        child: Center(child: Text(e,textAlign: TextAlign.center,style: TextStyle(color: textColor,fontWeight: FontWeight.w600,fontSize: 12),)),
      )).toList()
    );
  }


}
