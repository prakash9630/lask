import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/gift_vouchers/provider/used_voucher/used_voucher_notifier.dart';
import 'package:lask_client/features/gift_vouchers/widget/voucher_shimmer.dart';
import '../widget/no_voucher_view.dart';
import '../widget/voucher_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsedVoucherPage extends ConsumerWidget {
  const UsedVoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usedVoucherProv = ref.watch(usedVoucherNotifyProvider);
    final usedVoucherNotifyProv = ref.read(usedVoucherNotifyProvider.notifier);

    return usedVoucherProv.status.maybeWhen(
        orElse: () => const VoucherSimmer(),
        success: () {
          if (usedVoucherProv.voucherList!.isNotEmpty) {
            return NotificationListener<ScrollEndNotification>(
              onNotification: usedVoucherNotifyProv.unUsedVoucherPaginationNotifier,
              child: RefreshIndicator(
                onRefresh:()async{
                  ref.refresh(usedVoucherNotifyProvider.notifier).getUsedVoucher();
                } ,
                child: ListView.builder(
                    padding:  EdgeInsets.only(top: 25.h),
                    itemCount: usedVoucherProv.voucherList?.length,
                    itemBuilder: (context, index) {
                      return VoucherView(
                        vouchers: usedVoucherProv.voucherList![index],
                      );
                    }),
              ),
            );
          } else {
            return const NoVoucherView();
          }
        },
        error: () {
          return const Center(
            child: Text("Something went wrong"),
          );
        });
  }
}
