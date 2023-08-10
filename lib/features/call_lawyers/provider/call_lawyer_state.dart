import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/call_lawyers/model/call_lawyer_model.dart';
import '../../home_page/model/hompage_model.dart';
part 'call_lawyer_state.freezed.dart';

@freezed
abstract class CallLawyerState with _$CallLawyerState{
  const factory CallLawyerState({
    required FormStatus status,
    Failure? failure,
    CallLawyerModel? model,
    bool? pageLoading,
    List<RecentCalls>? callList

})=_CallLawyerState;

  factory CallLawyerState.initial({
    FormStatus status= const FormStatus.initial()

})=>CallLawyerState(status: status);
}