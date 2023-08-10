
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/features/gift_vouchers/model/voucher_model.dart';
import '../../../../core/model/form_status.dart';
import '../../../../core/network/api_base.dart';
part 'used_voucher_state.freezed.dart';
@freezed
abstract class UsedVoucherState with _$UsedVoucherState{
  const factory UsedVoucherState({
    required FormStatus status,
    Failure? failure,
    bool? isPageLoading,
    VoucherModel? model,
    List<Vouchers>? voucherList
})=_UsedVoucherState;

  factory UsedVoucherState.initial({
    FormStatus status = const FormStatus.initial()

  })=>UsedVoucherState(status: status);
}