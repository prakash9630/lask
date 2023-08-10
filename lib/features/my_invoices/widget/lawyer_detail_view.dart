import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../util/date_format.dart';
import '../model/invoice_model.dart';

class LawyerDetailView extends StatelessWidget {
  const LawyerDetailView(
      {Key? key, required this.onDownload, required this.onPreview,required this.invoices})
      : super(key: key);
  final void Function() onPreview;
  final void Function() onDownload;
  final Invoices invoices;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.containerBorder)),
      child: Column(
        children: [
          keyValue(key: "Lawyer", value: invoices.call?.lawyer?.user?.fullName??""),
          keyValue(key: "Lawyer License No.", value: invoices.call?.lawyer?.licenseNumber??""),
          keyValue(key: "Date of Issue", value:  convertedDate(invoices.call!.createdAt!)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(onPressed:onPreview, label: "Preview",leadingIcon: SvgPicture.asset(AssetPath.eyeIcon),),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: CustomButton(onPressed: onDownload, label: "Download",leadingIcon: SvgPicture.asset(AssetPath.downloadIcon)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget keyValue({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textW500S14(label: key, color: AppColors.lightGreyColor),
          textW500S14(label: value, color: AppColors.black2CColor),
        ],
      ),
    );
  }
}
