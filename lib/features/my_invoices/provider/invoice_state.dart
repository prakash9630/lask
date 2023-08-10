
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/my_invoices/model/invoice_model.dart';
part 'invoice_state.freezed.dart';

@freezed
abstract class InvoiceState with _$InvoiceState{
  const factory InvoiceState({
    required FormStatus status,
    required bool pageLoading,
    InvoiceModel? model,
    List<Invoices>? invoices,
    Failure? failure,
  })=_ServicesState;

  factory InvoiceState.initial(
      {
        FormStatus status=const FormStatus.initial(),
        bool pageLoading=false
      })=> InvoiceState(status: status,pageLoading: false);
}