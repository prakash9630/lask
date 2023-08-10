
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/our_services/model/service_model.dart';
part 'services_state.freezed.dart';

@freezed
abstract class ServicesState with _$ServicesState{

  const factory ServicesState({
    required FormStatus status,
    required bool pageLoading,
     ServiceModel? data,
     List<Services>? serviceList,
    Failure? failure,
  })=_ServicesState;

  factory ServicesState.initial(
  {
    FormStatus status=const FormStatus.initial(),
    bool pageLoading=false


})=> ServicesState(status: status,pageLoading: false);
}