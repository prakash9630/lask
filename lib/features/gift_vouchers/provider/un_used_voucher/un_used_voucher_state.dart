

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/gift_vouchers/model/voucher_model.dart';
part 'un_used_voucher_state.freezed.dart';

@freezed
abstract class UnUsedVoucherState with _$UnUsedVoucherState{
  const factory UnUsedVoucherState({
   required FormStatus status,
    Failure? failure,
    bool? isPageLoading,
    VoucherModel? model,
    List<Vouchers>? voucherList,

  })=_UnUsedVoucherState;

  factory UnUsedVoucherState.initial({
    FormStatus status = const FormStatus.initial()
})=>UnUsedVoucherState(status: status);
}