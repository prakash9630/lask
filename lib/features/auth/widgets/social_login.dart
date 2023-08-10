import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';

import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.borderColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Or",
                style: TextStyle(
                  color: AppColors.fontGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.borderColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showToast(text: "Coming Soon");
              },
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfff0f0f0),
                ),
                child: SvgPicture.asset(
                  AssetPath.iconGoogle,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                showToast(text: "Coming Soon");
                },
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfff0f0f0),
                ),
                child: SvgPicture.asset(
                  AssetPath.iconFacebook,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
