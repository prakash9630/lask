
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/my_invoices/widget/invoice_payment_info_view.dart';
import 'package:lask_client/util/date_format.dart';
import 'package:lask_client/widgets/custom_sliver_app_bar.dart';
import 'package:lask_client/widgets/pdf_preview_page.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../model/invoice_model.dart';
import '../provider/invoice_detail_provider/invoice_detail_notifier.dart';
import '../service/invoice_pdf_service.dart';
import '../widget/amount_paid_view.dart';
import '../widget/lawyer_detail_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class InvoiceDetailPage extends ConsumerStatefulWidget {
  const InvoiceDetailPage({Key? key,required this.invoices}) : super(key: key);
  final Invoices invoices;

  @override
  ConsumerState<InvoiceDetailPage> createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends ConsumerState<InvoiceDetailPage> {
  int flag=0;
  @override
  void didChangeDependencies()  {
    super.didChangeDependencies();
    if(flag==0){
     ref.read(invoiceDetailNotifyProvider.notifier).getInvoiceDetail(widget.invoices.id!);
      setState(() {
        flag=1;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      title: "Invoice Detail",
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 23.w,vertical: 30.h),
        child: Column(
          children: [
            //shor invoice info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: 12.w),
                  child: SvgPicture.asset(
                    AssetPath.invoiceInfo,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: textW500S13(label: 'Invoice #${widget.invoices.referenceNumber}',color: AppColors.lightGreyColor),
                    ),
                    textW600S15(label: widget.invoices.call?.lawyer?.user?.fullName??""),
                  ],
                ),
                const Spacer(),
                Expanded(child: textW500S13(label: 'Due: ${dateTimeFormat(widget.invoices.call!.createdAt!)}',color: AppColors.lightGreyColor))
              ],
            ),
             SizedBox(height: 30.h,),
             InvoicePaymentInfoView(invoices: widget.invoices,),
             SizedBox(height: 30.h,),
            AmountPaidView(onTap: (){}, amount: widget.invoices.amount?.toDouble()??0, isPaid: widget.invoices.isPaid!,),
             SizedBox(height: 30.h,),
            if(widget.invoices.file!=null)
            LawyerDetailView(
              onDownload: () async {
                InvoicePdfServices.downloadPdf(url: widget.invoices.file!);

              }, onPreview: () async {
                context.router.push(PdfPreviewRoute(args: PdfPreviewPageArgs(
                  networkUrl: widget.invoices.file,
                  isNetwork: true
                )));

            }, invoices: widget.invoices,)
          ],
        ),
      ),
    );
  }
}
