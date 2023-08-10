import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/provider/filter_provider.dart';
import 'package:lask_client/features/call_lawyers/provider/call_lawyer_notifier.dart';
import 'package:lask_client/features/call_lawyers/widget/call_lawyer_simmer.dart';
import 'package:lask_client/features/call_lawyers/widget/no_call_log_view.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/asset_path.dart';
import '../../../widgets/custom_sliver_app_bar.dart';
import '../../../widgets/filter_dialog.dart';
import '../../base_page/provider/bottom_nav_provider.dart';
import '../widget/call_lawyer_view.dart';

@RoutePage()
class CallLawyerPage extends ConsumerStatefulWidget {
  const CallLawyerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CallLawyerPage> createState() => _CallLawyerPageState();
}

class _CallLawyerPageState extends ConsumerState<CallLawyerPage> {
  int flag=0;
  @override
  void didChangeDependencies() {
    if(flag==0){
      setState(() {
        ref.read(callLawyerNotifyProvider.notifier).getCallLog();
        flag=1;
      });
    }

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final callLawyerNotifyProv = ref.watch(callLawyerNotifyProvider.notifier);
    final callLawyerProv = ref.watch(callLawyerNotifyProvider);
    var bottomProv = ref.watch(navProvider);
    return CustomSliverAppBar(
      // onLeadingTap: () {
      //   bottomProv.changeNavIndex(0);
      // },
      actions: [
        InkWell(
          onTap: () async{
            showFilter(context, showRating: true,
            showDate: true,
            onFilter: (data) async {
             await ref.read(callLawyerNotifyProvider.notifier).getCallLog(params: data).whenComplete((){
               ref.read(filterProvider).clearData();
             });

            });
          },
          child: SvgPicture.asset(
            AssetPath.iconFilter,
          ),
        ),
      ],
      title: "Call Lawyer",
      onRefresh: () {
        ref.refresh(callLawyerNotifyProvider.notifier).getCallLog();
      },
      onNotification: callLawyerNotifyProv.callLogPaginationNotifier,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          callLawyerProv.status.maybeWhen(
            orElse: () => const CallLawyerShimmer(),
            success: () {
              if(callLawyerProv.callList!.isNotEmpty) {
                return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 22, left: 23, right: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textW600S18(label: "Your Last Called Lawyers"),
                        const SizedBox(
                          height: 10,
                        ),
                        textW400S14(
                            label:
                                "Call your last called lawyers directly from here",
                            color: AppColors.lightGrey),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  ...List.generate(callLawyerProv.callList!.length, (index) {
                    return CallLawyerView(
                      recentCalls: callLawyerProv.callList![index],
                    );
                  }),
                  const SizedBox(height: 15,),
                  if (callLawyerProv.pageLoading == true) loadingView()
                ],
              );
              } else {
                return const NoCallLogView();
              }},
          )
        ],
      ),
    );
  }
}
