import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/gift_vouchers/pages/unused_voucher_page.dart';
import 'package:lask_client/features/gift_vouchers/pages/used_voucher_page.dart';
import 'package:lask_client/widgets/custom_page_holder.dart';
import '../provider/un_used_voucher/un_used_voucher_notifier.dart';
import '../provider/used_voucher/used_voucher_notifier.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class GiftVoucherPage extends ConsumerStatefulWidget {
  const GiftVoucherPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GiftVoucherPage> createState() => _GiftVoucherPageState();
}

class _GiftVoucherPageState extends ConsumerState<GiftVoucherPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  int selectedTabIndex = 0;
  int flag=0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(flag==0){
      setState(() {
        ref.read(unUsedVoucherNotifyProvider.notifier).getUnUsedVoucher();
        ref.read(usedVoucherNotifyProvider.notifier).getUsedVoucher();
        flag=1;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageHolder(
      title: "Gift Vouchers",
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(top: 23.h),
              child: Container(
                height: 44.h,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(10.r)),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedTabIndex = index;
                    });
                  },
                  controller: tabController,
                  labelColor: AppColors.whiteColor,
                  unselectedLabelColor: AppColors.primaryColor,
                  labelStyle:  TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(selectedTabIndex == 0 ? 9 : 0),
                          topRight:
                              Radius.circular(selectedTabIndex == 0 ? 0 : 9),
                          bottomLeft:
                              Radius.circular(selectedTabIndex == 0 ? 9 : 0),
                          bottomRight:
                              Radius.circular(selectedTabIndex == 0 ? 0 : 9))),
                  tabs: const [
                    Tab(
                      text: "Unused Vouchers",
                    ),
                    Tab(
                      text: "Used Vouchers",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                 physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const [UnusedVouchersPage(), UsedVoucherPage()]),
            )
          ],
        ),
      ),
    );
  }
}
