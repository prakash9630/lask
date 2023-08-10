import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/provider/filter_provider.dart';
import 'package:lask_client/features/my_lawyers/provider/my_lawyers_notifier.dart';
import 'package:lask_client/features/my_lawyers/widget/my_lawyer_shimmer.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/widgets/custom_sliver_app_bar.dart';
import '../../../components/custom_search_fields.dart';
import '../../../core/consts/asset_path.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../../widgets/filter_dialog.dart';
import '../../base_page/provider/bottom_nav_provider.dart';
import '../../home_page/widget/lawer_info_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyLawyerPage extends ConsumerStatefulWidget {
  const MyLawyerPage({Key? key, this.fromNavBar = false, this.serviceId,this.voucherId})
      : super(key: key);
  final bool fromNavBar;
  final int? serviceId;
  final int? voucherId;

  @override
  ConsumerState<MyLawyerPage> createState() => _MyLawyerPageState();
}

class _MyLawyerPageState extends ConsumerState<MyLawyerPage> {
  int flag = 0;
  Map<String, dynamic>? params;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (flag == 0) {
      if (widget.serviceId != null) {
        params = {"service_id": widget.serviceId};
      }
      setState(() {
        ref.read(myLawyerNotifierProvider.notifier).getData(params: params);
        flag = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final myLawyerNotifyProv = ref.watch(myLawyerNotifierProvider.notifier);
    var bottomProv = ref.watch(navProvider);
    final myLawyerProv = ref.watch(myLawyerNotifierProvider);
    return CustomSliverAppBar(
        onLeadingTap: () {
          if (!widget.fromNavBar) {
            Navigator.pop(context);
          } else {
            bottomProv.changeNavIndex(0);
          }
        },
        actions: [
          InkWell(
            onTap: () async {
              showFilter(context, showRating: true, onFilter: (data) async {
                if (widget.serviceId != null) {
                  data['service_id'] = widget.serviceId;
                }
                await ref
                    .read(myLawyerNotifierProvider.notifier)
                    .getData(params: data)
                    .whenComplete(() {
                  ref.read(filterProvider).clearData();
                });
              });
            },
            child: SvgPicture.asset(
              AssetPath.iconFilter,
            ),
          ),
        ],
        title: "My Lawyers",
        isPageable: true,
        onRefresh: () {
          ref
              .refresh(myLawyerNotifierProvider.notifier)
              .getData(params: params);
        },
        onNotification: myLawyerNotifyProv.lawyerPageNotify,
        child: myLawyerProv.status.maybeWhen(
            orElse: () => const MyLawyerShimmer(),
            success: () {
              return Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 23.w, right: 23.w, top: 25.h),
                    child: CustomSearchField(
                      hintText: "Search a Lawyer by Name or License Number",
                      onSubmitted: (v) {
                        var params = {"name": v};
                        myLawyerNotifyProv.getData(params: params);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ...List.generate(myLawyerProv.lawyers!.length, (index) {
                    return LawyerInfoWidget(
                        lawyers: myLawyerProv.lawyers?[index],
                        voucherId: widget.voucherId,
                        purpose:
                            myLawyerProv.lawyers?[index].purposeOfLastCall);
                  }),
                  SizedBox(
                    height: 15.h,
                  ),
                  if (myLawyerProv.pageLoading == true) loadingView()
                ],
              );
            }));
  }
}
