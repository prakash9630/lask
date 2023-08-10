import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/our_services/widget/service_shimmer.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/widgets/custom_sliver_app_bar.dart';
import '../../../components/custom_search_fields.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../base_page/provider/bottom_nav_provider.dart';
import '../provider/services_notifier.dart';
import '../widget/services_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OurServicesPage extends ConsumerStatefulWidget {
  const OurServicesPage({Key? key, this.fromBasePage = false,this.voucherId})
      : super(key: key);
  final bool fromBasePage;
  final int? voucherId;

  @override
  ConsumerState<OurServicesPage> createState() => _OurServicesPageState();
}

class _OurServicesPageState extends ConsumerState<OurServicesPage> {
  int flag = 0;

  @override
  void didChangeDependencies() {
    if (flag == 0) {
      setState(() {
        ref.read(serviceNotifyProvider.notifier).getServices();
        flag = 1;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final serviceProv = ref.watch(serviceNotifyProvider);
    final serviceNotifyProv = ref.read(serviceNotifyProvider.notifier);
    var bottomProv = ref.watch(navProvider);

    return CustomSliverAppBar(
      title: "Our Services",
      isPageable: true,
      onLeadingTap: () {
        if (!widget.fromBasePage) {
          Navigator.pop(context);
        } else {
          bottomProv.changeNavIndex(0);
        }
      },
      onRefresh: () {
        ref.refresh(serviceNotifyProvider.notifier).getServices();
      },
      onNotification: serviceNotifyProv.servicePaginationNotifier,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 30.h),
          child: serviceProv.status.maybeWhen(
            success: () => Column(
              children: [
                CustomSearchField(
                  hintText: "Search Our Services",
                  onSubmitted: (v) {
                    ref.read(serviceNotifyProvider.notifier)
                        .getServices(query: {"q": v});
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: serviceProv.serviceList!.length,
                    itemBuilder: (context, index) {
                      return ServicesView(
                        services: serviceProv.serviceList![index],
                        voucherId: widget.voucherId,
                      );
                    }),
                if (serviceProv.pageLoading == true) loadingView()
              ],
            ),
            orElse: () => const ServicesShimmer(),
          )),
    );
  }
}
