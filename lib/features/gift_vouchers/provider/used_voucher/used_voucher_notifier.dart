import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/gift_vouchers/provider/used_voucher/used_voucher_state.dart';
import '../../../../core/model/form_status.dart';
import '../../model/voucher_model.dart';
import '../../repo/voucher_repo.dart';

final usedVoucherNotifyProvider = StateNotifierProvider<
    UsedVoucherNotifier,
    UsedVoucherState>((ref) {
  return UsedVoucherNotifier(ref);
});

class UsedVoucherNotifier extends StateNotifier<UsedVoucherState> {
  UsedVoucherNotifier(this.ref) :super(UsedVoucherState.initial());

  final Ref ref;
  VoucherModel? model;
  List<Vouchers> voucherList = [];

  bool unUsedVoucherPaginationNotifier(
      ScrollEndNotification scrollEndNotification) {
    if (scrollEndNotification.metrics.pixels ==
        scrollEndNotification.metrics.maxScrollExtent) {
      if (model?.next != null) {
        getUsedVoucher(url: model?.next);
      }
    }
    return true;
  }

  void getUsedVoucher({String? url}) async {
    final response = await ref.read(voucherRepoProvider).fetchVoucher(url: url,params: {"used":true});
    if (url == null) {
      state = response.fold(
              (l) =>
              state.copyWith(status: const FormStatus.error(),
                  isPageLoading: false,
                  failure: l),
              (r) {
            model = VoucherModel.fromJson(r);
            voucherList = model?.vouchers ?? [];
            return state.copyWith(status: const FormStatus.success(),
                isPageLoading: false,
                model: model,
                voucherList: voucherList);
          });
    } else {
      state = response.fold(
              (l) => state,
              (r) {
            model = VoucherModel.fromJson(r);
            voucherList.addAll(model?.vouchers ?? []);
            return state.copyWith(status: const FormStatus.success(),
                isPageLoading: true,
                model: model,
                voucherList: voucherList);
          });
      state = state.copyWith(isPageLoading: false);
    }
  }
}