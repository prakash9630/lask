

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
part 'invoice_detail_state.freezed.dart';



@freezed
abstract class InvoiceDetailState with _$InvoiceDetailState{
  const factory InvoiceDetailState({
    required FormStatus status

})=_InvoiceDetailState;

  factory InvoiceDetailState.initial({
    FormStatus status=const  FormStatus.initial()

})=>InvoiceDetailState(status: status);
}