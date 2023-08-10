
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/support_ticket/model/support_model.dart';
part 'support_state.freezed.dart';

@freezed
class SupportState with _$SupportState{
  const factory SupportState(
  {
    required FormStatus status,
    Failure? failure,
    SupportModel? model,
    List<Support>? supports,
    bool? pageLoading,

  })=_SupportState;

  factory SupportState.initial({
    FormStatus status= const FormStatus.initial(),
    bool pageLoading=false
})=> SupportState(status: status);

}