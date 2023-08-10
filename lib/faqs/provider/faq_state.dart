
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/faqs/model/faq_model.dart';
part 'faq_state.freezed.dart';

@freezed
abstract class FaqState with _$FaqState{
  const factory FaqState({
    required FormStatus status,
    FaqModel? model,
    Failure? failure,
    List<Faqs>? faqs,
    bool? pageLoading,
})=_FaqState;

  factory FaqState.initial({
    FormStatus status=const FormStatus.initial(),
    bool pageLoading=false

})=>FaqState(status: status,pageLoading: pageLoading);

}