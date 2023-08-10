

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/gift_vouchers/model/voucher_model.dart';
import 'package:lask_client/features/gift_vouchers/provider/un_used_voucher/un_used_voucher_state.dart';
import 'package:lask_client/features/gift_vouchers/repo/voucher_repo.dart';

final unUsedVoucherNotifyProvider = StateNotifierProvider<UnUsedVoucherNotifier,UnUsedVoucherState>((ref) {
  return UnUsedVoucherNotifier(ref);
});

class UnUsedVoucherNotifier extends StateNotifier<UnUsedVoucherState>{
  UnUsedVoucherNotifier(this.ref):super(UnUsedVoucherState.initial());
  final Ref ref;
  VoucherModel? model;
  List<Vouchers> voucherList=[];

  bool unUsedVoucherPaginationNotifier(ScrollEndNotification scrollEndNotification){
    if(scrollEndNotification.metrics.pixels==scrollEndNotification.metrics.maxScrollExtent){
      if(model?.next!=null){
        getUnUsedVoucher(url: model?.next);
      }
    }
    return true;
  }

  void getUnUsedVoucher({String? url})async{
    final response = await ref.read(voucherRepoProvider).fetchVoucher(url:url,params: {"used":false});
    if(url==null){
      state= response.fold(
              (l) => state.copyWith(status: const FormStatus.error(),isPageLoading: false,failure: l),
              (r) {
            model= VoucherModel.fromJson(r);
            voucherList=model?.vouchers??[];
            return state.copyWith(status: const FormStatus.success(),isPageLoading: false,model: model,voucherList: voucherList);
          });
    }else{
      state= response.fold(
              (l) => state,
              (r) {
            model= VoucherModel.fromJson(r);
            voucherList.addAll(model?.vouchers??[]);
            return state.copyWith(status: const FormStatus.success(),isPageLoading: true,model: model,voucherList: voucherList);
          });
     state= state.copyWith(isPageLoading: false);
    }
  }
}