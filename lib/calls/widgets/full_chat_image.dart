import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/consts/asset_path.dart';
import '../../core/consts/colors.dart';
import '../../features/my_invoices/service/invoice_pdf_service.dart';
import '../model/chat_detail_data_model.dart';

showFullImg(BuildContext context, {required ChatDetailDataModel model}) {
  showDialog(
      context: context,
      builder: (context) {
        return ImageDialog(
          model: model,
        );
      });
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key, required this.model}) : super(key: key);
  final ChatDetailDataModel model;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          color: AppColors.whiteColor,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.network(
                    model.fileUrl!,
                    fit: BoxFit.fitWidth,
                  )),
              Positioned(
                  left: 25,
                  top: 25,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AssetPath.iconBack))),
              Positioned(
                  right: 25,
                  top: 25,
                  child: InkWell(
                      onTap: () {
                        InvoicePdfServices.downloadPdf(
                         url: model.fileUrl!,
                          desc: model.fileName
                        );
                      },
                      child: SvgPicture.asset(AssetPath.downloadIcon,color: AppColors.primaryColor,))),
            ],
          )),
    );
  }
}
