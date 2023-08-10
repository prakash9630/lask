import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/profile/provider/profile_provider.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

void showShareDialog({required BuildContext context}) {
  showDialog(context: context, builder: (context) {
    return const ShareDialog();
  });
}

class ShareDialog extends ConsumerStatefulWidget {
  const ShareDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<ShareDialog> createState() => _ShareDialogState();
}

class _ShareDialogState extends ConsumerState<ShareDialog> {
  bool copied = false;

  @override
  Widget build(BuildContext context) {
    final username= ref.read(profileProvider).model?.fullName;
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              textW600S20(label: "Share this app"),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: const Icon(Icons.close, size: 25,)),
            ],),
            const SizedBox(height: 25,),
            textW500S15(label: "Share Via QR Code",
                color: AppColors.selectedBorderColor),
            const SizedBox(height: 15,),
            Image.asset(AssetPath.qrImg, height: 210, width: 210,),
            const SizedBox(height: 30,),
            textW500S15(label: "Share Via URL Link",
                color: AppColors.selectedBorderColor),
            const SizedBox(height: 15,),
            const CustomTextField(labelText: "",
              readOnly: true,
              initialValue: "https://linktr.ee/saymon.acharya",),
            const SizedBox(height: 25,),

            CustomButton(onPressed: !copied ? () async {
              await Clipboard.setData(ClipboardData(
                  text: "This link is belong to lask, Lawyer "
                      "and Client communication agency in Portugal, the link sharing"
                      " by your friend  $username  Please download and start to make"
                      " your earning by communicating clients in Immigration area.\n\n"
                      "https://linktr.ee/saymon.acharya"));
                  if(copied==false){
              setState(() {
              copied=true;
              });
              }

              } : null,
              label: copied ? "URL Link Copied" : "Copy URL to Clipboard",
              leadingIcon: SvgPicture.asset(
                  copied ? AssetPath.whiteTickIcon : AssetPath.copyIcon),
            )


          ],
        ),

      ),
    );
  }
}
