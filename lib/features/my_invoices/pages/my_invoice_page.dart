import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../components/custom_search_fields.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../../util/date_format.dart';
import '../../../widgets/custom_sliver_app_bar.dart';
import '../../../widgets/filter_dialog.dart';
import '../model/invoice_model.dart';
import '../provider/invoice_notifier.dart';
import '../provider/invoice_state.dart';
import '../service/invoice_pdf_service.dart';
import '../widget/invoice_simmer.dart';
import '../widget/invoice_widget.dart';
import '../widget/no_invoice_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyInvoicePage extends ConsumerStatefulWidget {
  const MyInvoicePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyInvoicePage> createState() => _MyInvoicePageState();
}

class _MyInvoicePageState extends ConsumerState<MyInvoicePage> {
  int flag = 0;
  List<Invoices> invoices = [];
  List<int> selectedIndexes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (flag == 0) {
      setState(() {
        ref.read(invoiceNotifyProvider.notifier).getInvoice();
        flag = 1;
      });
    }
  }

  void selectIndex(int index, InvoiceState invoiceProv) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
        invoices.remove(invoiceProv.invoices![index]);
      } else {
        selectedIndexes.add(index);
        invoices.add(invoiceProv.invoices![index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final invoiceProv = ref.watch(invoiceNotifyProvider);
    final invoiceNotifyProv = ref.read(invoiceNotifyProvider.notifier);
    return CustomSliverAppBar(
      isPageable: true,
      onRefresh: () {
        ref.refresh(invoiceNotifyProvider.notifier).getInvoice();
      },
      onNotification: invoiceNotifyProv.invoicePageNotifier,
      actions: [
        InkWell(
          onTap: () {
            if (invoices.isNotEmpty) {
              InvoicePdfServices.downloadCsv(invoices,ref);
            } else {
              showFilter(context, onFilter: (data) {
                ref.read(invoiceNotifyProvider.notifier).getInvoice(params: data);
              });
            }
          },
          child: SvgPicture.asset(
            invoices.isEmpty
                ? AssetPath.iconFilter
                : AssetPath.downloadIconBlue,
          ),
        ),
      ],
      title: "My Invoices",
      child: invoiceProv.status.maybeWhen(
          orElse: () => const InvoiceSimmer(),
          success: () {
            if (invoiceProv.invoices!.isNotEmpty) {
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 22.h,horizontal: 23.w),
                child: Column(
                  children: [
                    CustomSearchField(
                      hintText: "Search invoices by lawyer name or Id ",
                      onSubmitted: (v) {
                        var params = {"name": v};
                        ref.read(invoiceNotifyProvider.notifier).getInvoice(params: params);
                      },
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                       if(invoices.isNotEmpty)
                         Align(
                           alignment: Alignment.topRight,
                           child: Padding(
                             padding:  EdgeInsets.symmetric(vertical: 15.h),
                             child: InkWell(
                               onTap: (){
                                 setState(() {
                                   invoices=[];
                                   selectedIndexes=[];
                                 });
                               },
                                 child: textW500S16(label: "Unselect All",color: AppColors.primaryColor)),
                           ),
                         ),
                    ...List.generate(invoiceProv.invoices!.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 15.h),
                            child: textW500S13(
                                label: convertedDate(
                                    invoiceProv.invoices?[index].call?.createdAt),
                                color: AppColors.lightGreyColor),
                          ),
                          InkWell(
                              onTap: () {
                                if (invoices.isNotEmpty) {
                                  selectIndex(index, invoiceProv);
                                } else {
                                  context.router.push(InvoiceDetailRoute(
                                      invoices: invoiceProv.invoices![index]));
                                }
                              },
                              onLongPress: () {
                                selectIndex(index, invoiceProv);
                              },
                              child: InvoiceWidget(
                                invoices: invoiceProv.invoices![index],
                                index: index,
                                selectedIndex: selectedIndexes,
                              )),
                        ],
                      );
                    }),
                     SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              );
            } else {
              return const NoInvoiceView();
            }
          }),
    );
  }
}
