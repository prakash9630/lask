import 'package:flutter/material.dart';

import '../../../core/consts/colors.dart';
import '../../../helper/widit_util/widget_util.dart';

class ContactUsHeader extends StatelessWidget {
  const ContactUsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.only(top: 30,bottom: 10),
        child: textW600S18(label: "Please fill in the form below.",),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: textW400S14(label: "We will reply to you for administrative matters as soon as possible. For legal questions or enquiries, messages will be forwarded to the appropriate lawyers for you to speak with, lawyer fee may be applied.",
            color: AppColors.lightFontGrey),
      ),
    ],);
  }
}
