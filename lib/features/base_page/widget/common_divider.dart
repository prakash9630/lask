

import 'package:flutter/material.dart';

import '../../../core/consts/colors.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(right: 33.0, left: 20.0),
      child: const Divider(
        thickness: 1,
        color: AppColors.borderColor,
      ),
    );
  }
}
