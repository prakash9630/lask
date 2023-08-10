import 'package:flutter/material.dart';

import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../helper/widit_util/widget_util.dart';
import 'contact_us_form.dart';
import 'contact_us_header.dart';

class ContactUsContent extends StatelessWidget {
  const ContactUsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          title: textW600S20(
            label: "Contact Us",
            color: AppColors.whiteColor,
          ),
          leading: InkWell(
              onTap: ()=>Navigator.pop(context),
              child: const Icon(Icons.arrow_back,color: AppColors.whiteColor,)),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        Image.asset(AssetPath.contactUsImage),
        Container(
          padding:const  EdgeInsets.symmetric(horizontal: 23),
          decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40))),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ContactUsHeader(),
               ContactUsForm(),
            ],
          ),
        ),
      ],
    );
  }
}
