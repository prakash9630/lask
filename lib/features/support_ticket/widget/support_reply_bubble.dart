import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import '../../../core/consts/colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../widgets/image_viewer.dart';
import '../../../widgets/pdf_preview_page.dart';
import '../model/support_attachment_model.dart';
import '../model/support_ticket_reply_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportReplyBubble extends StatelessWidget {
  const SupportReplyBubble({
    super.key,
    required this.model,
    required this.index,
  });

  final SupportTicketReplyModel? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        bottom: 10.0.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Container(
              padding:  EdgeInsets.all(15.0.r),
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.vertical(
                  top: Radius.circular(
                    10.0.r,
                  ),
                ),
                border: Border.all(color: AppColors.borderColor),
                color: AppColors.lightContainer,
              ),
              child: RichText(
                text: TextSpan(
                  text: "Posted by ",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    color: AppColors.fontGrey,
                  ),
                  children: [
                    TextSpan(
                      text: "${model?.userType.toCapitalizeFirst} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                          "on ${model?.createdAt.toFormattedString("dd, MMM yyyy hh:mm:ss a")}",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:  EdgeInsets.all(15.0.r),
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.vertical(
                  bottom: Radius.circular(
                    10.0.r,
                  ),
                ),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model!.message),
                   SizedBox(
                    height: 10.h,
                  ),
                  if (model != null &&
                      model!.replyAttachment.isNotEmpty) ...{
                    Wrap(
                      spacing: 10.0.r,
                      runSpacing: 10.0.r,
                      children: List.generate(
                        model!.replyAttachment.length,
                        (indx) {
                          SupportAttachmentModel data =
                              model!.replyAttachment[indx];
                          return InkWell(
                            onTap: () {
                              if (data.file.isPdf) {
                                context.router.push(PdfPreviewRoute(
                                    args: PdfPreviewPageArgs(
                                  isNetwork: true,
                                  networkUrl: data.file,
                                )));
                              } else if (data.file.isImage) {
                               Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) => ImageViewer(
                                   type: ImageViewType.network,
                                   imageList: [data.file],
                                   initialPage: 0,
                                 ),
                               ));
                              } else {
                                showErrorToast(text: "Unsupported File Type");
                              }
                            },
                            child: Container(
                              height: 120.h,
                              width: 100.w,
                              padding:  EdgeInsets.all(2.h),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderColor),
                                borderRadius: BorderRadius.circular(4.0.r),
                              ),
                              child: data.file.isPdf
                                  ? Center(
                                      child: _buildPdfIcon(),
                                    )
                                  : (data.file.isImage
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.0.r),
                                          child: Image.network(
                                            data.file,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : null),
                            ),
                          );
                        },
                      ),
                    )
                  }
                ],
              ),
            ),

        ],
      ),
    );
  }

  Container _buildPdfIcon() {
    return Container(
      padding:  EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(4.0.r),
      ),
      child:  Text(
        "PDF",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
