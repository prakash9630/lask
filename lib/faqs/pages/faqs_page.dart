import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/faqs/provider/faq_notifier.dart';
import 'package:lask_client/faqs/widget/faqs_view.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_sliver_app_bar.dart';
import '../../components/custom_button.dart';
import '../../components/custom_search_fields.dart';
import '../model/faq_model.dart';
import '../widget/faq_simmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FaqsPage extends ConsumerStatefulWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends ConsumerState<FaqsPage> {
  int flag = 0;
  List<Faqs> faqs=[];


  @override
  void didChangeDependencies() {
    if (flag == 0) {
      setState(() {
        ref.read(faqNotifyProvider.notifier).getFaqs();
        flag = 1;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final faqPrv = ref.watch(faqNotifyProvider);
    final faqNotifyPrv = ref.watch(faqNotifyProvider.notifier);
    return CustomSliverAppBar(
        title: "FAQs",
        isPageable: true,
        onRefresh:(){
          ref.refresh(faqNotifyProvider.notifier).getFaqs();
        },
        onNotification: faqNotifyPrv.faqPaginationNotifier,
        bottomNavBar: Container(
          height: 115.h,
          padding:
               EdgeInsets.only(left: 23.w, right: 23.w, top: 14.h, bottom: 18.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: 10.0.h),
                child: textW500S14(
                    label: "Still stuck? Help is just a message away.",
                    color: AppColors.lightGreyColor),
              ),
              CustomButton(
                onPressed: () {
                  context.router.push(const ContactUsRoute());
                },
                label: 'Send a message',
              ),
            ],
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 23.w, right: 23.w, top: 22.h),
          child: faqPrv.status.maybeWhen(
              orElse: () => const FaqSimmer(),
              success: () {
                return Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: textW600S18(
                          label:
                              "We’re here to help you with anything and everything on LASK"),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 25.h),
                      child: textW400S14(
                          label:
                              "Here are some of the most frequently asked questions asked by users on our platform."),
                    ),
                    textFieldPadding(
                      child: CustomSearchField(
                        hintText: "Search faqs",
                        onSubmitted: (v) {
                          setState(() {
                           faqs= faqPrv.faqs!.where((element) => element.question!.toLowerCase().contains(v!.toLowerCase())).toList();
                           if(faqs.isEmpty){
                             showErrorToast(text: "Faqs not found");
                           }
                          });
                        },
                      ),
                    ),
                    if(faqs.isNotEmpty)
                      ...List.generate(faqs.length, (index) {
                        return FaqsView(
                          index: index,
                          faqs: faqs[index],
                        );
                      })
                    else
                    ...List.generate(faqPrv.faqs!.length, (index) {
                      return FaqsView(
                        index: index,
                        faqs: faqPrv.faqs![index],
                      );
                    }),
                    if (faqPrv.pageLoading == true) loadingView()
                  ],
                );
              }),
        ));
  }
}
