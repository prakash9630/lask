
import 'package:flutter/material.dart';
import 'package:lask_client/features/home_page/model/hompage_model.dart';
import 'package:lask_client/util/date_format.dart';

import '../../../core/consts/colors.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../home_page/widget/lawer_info_widget.dart';

class CallLawyerView extends StatelessWidget {
  const CallLawyerView({Key? key,this.recentCalls}) : super(key: key);

  final RecentCalls? recentCalls;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.only(left: 23,right: 23,top: 19),
        child: textW500S13(label: convertedDate(recentCalls?.createdAt),color: AppColors.lightGreyColor),
      ),
     const SizedBox(height: 19,),
        LawyerInfoWidget(lawyers: recentCalls?.lawyer,purpose: recentCalls?.service,)
    ],);
  }
}
