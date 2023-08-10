import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/colors.dart';
import '../../../helper/utils/app_utils.dart';
import '../model/invoice_model.dart';
import '../service/invoice_pdf_service.dart';
import 'icon_and_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({Key? key,required this.invoices,this.selectedIndex,required this.index}) : super(key: key);
  final Invoices invoices;
  final List<int>? selectedIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: invoices.call?.lawyer?.user?.userImage??"",
                  height: 70.w,
                  width: 70.w,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return CircleAvatar(
                        backgroundColor: AppColors.primaryColor.withOpacity(0.7),
                        radius: 50.0.r,
                        child:  Icon(
                          Icons.person,
                          color: AppColors.whiteColor,
                          size: 40.0.r,
                        ));
                  },
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textW500S15(label: invoices.call?.lawyer?.user?.fullName??""),
                  SizedBox(height: 12.h,),
                  Row(
                    children: [
                      RichText(
                        text:  TextSpan(
                          text: 'ID : ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.lightGrey),
                          children: <TextSpan>[
                            TextSpan(
                                text: invoices.referenceNumber,
                                style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.black2CColor)),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w,),
                      RichText(
                        text:  TextSpan(
                          text: 'Duration : ',
                          style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: AppColors.lightGrey),
                          children: <TextSpan>[
                            TextSpan(
                                text:formatDuration(invoices.call?.duration?.toInt()??0),
                                style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: AppColors.black2CColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h,),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        IconTextWidget(
                          onTap: (){
                            InvoicePdfServices.downloadPdf(url: invoices.file!);
                          },
                          icon: AssetPath.iconPdf, label: 'Download Invoice',textColor: AppColors.primaryColor,),
                        //SizedBox(width: 20.w,),
                        // VerticalDivider(
                        //   thickness: 2.h,
                        //   width: 20.w,
                        //   color:AppColors.containerBorder,
                        // ),
                        // SizedBox(width: 20.w,),
                        // IconTextWidget(icon: AssetPath.shareIcon, label: 'Share',textColor: AppColors.secondaryColor,)
                      ],),
                  )
                ],
              )
            ],
          ),
          if(selectedIndex!.contains(index))
          Positioned(
              right: 10,
              child: SvgPicture.asset(AssetPath.checkIcon)),

        ],
      ),
    );
  }
}
