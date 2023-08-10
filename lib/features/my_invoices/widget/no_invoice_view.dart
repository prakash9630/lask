
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../../widgets/empty_page_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NoInvoiceView extends StatelessWidget {
  const NoInvoiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 150.h),
          child: Image.asset(AssetPath.emptyInvoice),
        ),
        Padding(
          padding:  EdgeInsets.only(top: 30.h, bottom: 25.h),
          child: textW500S15(
              label: 'Your invoice list is empty!',
              color: AppColors.lightGreyColor),
        ),
        EmptyPageBtn(onTap: ()async{
           context.router.pop();
        }),
      ],
    );
  }
}
