
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/contact_us/widget/purpose_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void showPurposeDialogue(BuildContext context,{required Function(String) onChoose}){
  showDialog(
      context: (context), builder: (context){
    return  PurposeDialogue(onChoose: onChoose,);

  });

}

class PurposeDialogue extends StatefulWidget {
  const PurposeDialogue({Key? key,required this.onChoose}) : super(key: key);
  final Function(String) onChoose;

  @override
  State<PurposeDialogue> createState() => _PurposeDialogueState();
}

class _PurposeDialogueState extends State<PurposeDialogue> {
  int? selectedIndex;


  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      child: Container(
        padding:  EdgeInsets.all(10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex=index;
                      widget.onChoose(purposeList[index]);
                      Navigator.pop(context);

                    });
                  },
                    child: PurposeListView(label: purposeList[index], isSelected: index==selectedIndex,));
            }, separatorBuilder: (context,index){
              return Divider(thickness: 1.h,color: AppColors.borderColor,);

            }, itemCount: purposeList.length),
          ],
        ),
      )
    );
  }
}

List<String> purposeList=[
  "Suggestion & complaint email to admin",
  "Technical Issues",
  "Not Satisfied with Lawyer",
  "Not Satisfied with Call Centre",
  "Request Gift Voucher (Refund is not possible)",
  "Problem not listed"
];

