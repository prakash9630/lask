import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/gift_vouchers/provider/un_used_voucher/un_used_voucher_notifier.dart';
import 'package:lask_client/features/gift_vouchers/widget/voucher_shimmer.dart';
import '../widget/no_voucher_view.dart';
import '../widget/voucher_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnusedVouchersPage extends ConsumerWidget {
  const UnusedVouchersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unUsedVoucherProv = ref.watch(unUsedVoucherNotifyProvider);
    return unUsedVoucherProv.status.maybeWhen(
        orElse: () => const VoucherSimmer(),
        success: () {
          if (unUsedVoucherProv.voucherList!.isNotEmpty) {
            return NotificationListener<ScrollEndNotification>(
              onNotification: ref
                  .read(unUsedVoucherNotifyProvider.notifier)
                  .unUsedVoucherPaginationNotifier,
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.refresh(unUsedVoucherNotifyProvider.notifier)
                      .getUnUsedVoucher();
                },
                child: ListView.builder(
                    padding:  EdgeInsets.only(top: 25.h),
                    itemCount: unUsedVoucherProv.voucherList!.length,
                    itemBuilder: (context, index) {
                      return VoucherView(
                        vouchers: unUsedVoucherProv.voucherList![index],
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
