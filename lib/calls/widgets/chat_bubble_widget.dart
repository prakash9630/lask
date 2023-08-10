
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:intl/intl.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import '../../core/consts/asset_path.dart';
import '../../core/consts/colors.dart';
import '../../features/my_invoices/service/invoice_pdf_service.dart';
import '../../widgets/custom_cached_image.dart';
import '../../widgets/image_viewer.dart';
import '../../widgets/pdf_preview_page.dart';
import '../model/chat_detail_data_model.dart';


enum _ChatBubbleType { pdf, text, image }

class ChatBubbleCard extends StatelessWidget {
  const ChatBubbleCard({
    super.key,
    required this.isSender,
    required this.model,
  });

  final bool isSender;
  final ChatDetailDataModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
      isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isSender) _buildCircularImage(isSender),
            Expanded(
              child: Column(
                crossAxisAlignment: isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  if (model.fileUrl != null) ...[
                    if (model.isPdf) ...[
                      _ChatBubble(
                        isSender: isSender,
                        type: _ChatBubbleType.pdf,
                        child: _buildPdfBubble(
                          isProcessing: model.showProcessing,
                        ),
                      ),
                    ] else if (model.isImage) ...[
                      _ChatBubble(
                        isSender: isSender,
                        type: _ChatBubbleType.image,
                        child: _buildImageBubble(
                          isProcessing: model.showProcessing,
                        ),
                      ),
                    ]
                  ],
                  if (model.message.isNotEmpty) ...[
                    const SizedBox(
                      height: 10,
                    ),
                    _ChatBubble(
                      isSender: isSender,
                      type: _ChatBubbleType.text,
                      child: Text(
                        model.message,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isSender ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          DateFormat("hh:mm a").format(model.dateTime),
          style: const TextStyle(
            color: AppColors.lightFontGrey,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildImageBubble({required bool isProcessing}) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: isProcessing
            ? null
            : () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewer(
                imageList:  [model.fileUrl!],
                initialPage: 0,
                type: ImageViewType.network,
              ),
            ),
          );
        },
        child: SizedBox(
          width: 100,
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                model.fileUrl!,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              if (isProcessing) ...[
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Uploading...",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Builder _buildPdfBubble({required bool isProcessing}) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: isProcessing
              ? null
              : () {
            context.router.push(PdfPreviewRoute(args: PdfPreviewPageArgs(
              networkUrl: model.fileUrl,
              isNetwork: true,
              showDownload: true,
            )));


            // NavigationService.instance.pushNamed(
            //   PdfPreviewPage.routeName,
            //   args: PdfPreviewPageArgs(
            //     pdfData: model.filePath,
            //     isFile: true,
            //     showDownload: true,
            //   ),
            // );
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(15),
                  borderRadius: BorderRadius.circular(20).copyWith(
                    bottomLeft: Radius.circular(isSender ? 20 : 0),
                    bottomRight: Radius.circular(isSender ? 0 : 20),
                  ),
                  border:
                  isSender ? null : Border.all(color: AppColors.primaryColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AssetPath.pdfImage),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${model.fileName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          if (model.fileSize != null)
                            Text(
                              "${model.fileSize}",
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.lightFontGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                    isSender
                        ? const Icon(Icons.visibility_outlined)
                        : InkWell(
                      onTap: () {
                        InvoicePdfServices.downloadPdf(
                         url:model.fileUrl!,
                          desc: "${model.fileName} Downloaded",
                        );
                      },
                      child: const Iconify(
                        MaterialSymbols.download_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (isProcessing)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Uploading...",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      }
    );
  }

  Padding _buildCircularImage(bool isSender) {
    return Padding(
      padding:
      EdgeInsets.only(left: isSender ? 15 : 0, right: isSender ? 0 : 15),
      child: const CircleAvatar(
        radius: 12.5,
        child: CustomCachedImage(
          borderRadius: 12.5,
          imageUrl:
          "https://s3-alpha-sig.figma.com/img/2a36/75cb/0d455e0e73abc5df35c50a51974cee30?Expires=1686528000&Signature=XKKBu5kzGzarEGhYpstAGAYwptTqEcaLPZvck2GPo9-~Pn-WCsz-Z2XligFDcO7ko5QSBuiRBZNfitaYjUrMaFxnHl2wQfUpjxjxNA8wN9AOXjR071qj8UDt2nyaVz5SEqs40AY3LHIq9YlSNEZCmggQTfKVDBDpUBav9qMPtmfk1UDSS5tp22i1Mx7pPOQ-dUJQ90XgjHCfznTW2c-15OgoEotuH-Czm6kSxdAtsRD8wCp~AcDYJV0DxDEBJsgdf5Zh6NsRN8rdAQScBrbz84427erBepbw9CFmjAQhKv9dRbdL7oHMtmAmNzLoY0kGT2dmPyXUzQMBACa0w-x9Nw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    required this.isSender,
    required this.child,
    required this.type,
  });

  final bool isSender;
  final Widget child;
  final _ChatBubbleType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (!isSender && (type != _ChatBubbleType.text))
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: (isSender)
            ? AppColors.messageBoxText.withOpacity(0.85)
            : (type != _ChatBubbleType.text
            ? null
            : AppColors.primaryColor.withOpacity(0.85)),
        borderRadius: BorderRadius.circular(20).copyWith(
          bottomLeft: Radius.circular(isSender ? 20 : 0),
          bottomRight: Radius.circular(isSender ? 0 : 20),
        ),
      ),
      child: type == _ChatBubbleType.image
          ? ClipRRect(
        borderRadius: BorderRadius.circular(20).copyWith(
          bottomLeft: Radius.circular(isSender ? 20 : 0),
          bottomRight: Radius.circular(isSender ? 0 : 20),
        ),
        child: child,
      )
          : child,
    );
  }
}
