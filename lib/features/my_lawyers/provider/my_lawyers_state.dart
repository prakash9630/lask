

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/my_lawyers/model/my_lawers_model.dart';
import '../../../core/network/api_base.dart';
import '../../home_page/model/hompage_model.dart';
part 'my_lawyers_state.freezed.dart';

@freezed
class MyLawyersState with _$MyLawyersState {
  const factory MyLawyersState({
    required FormStatus status,
    Failure? failure,
    MyLawyersModel? model,
    List<Lawyer>? lawyers,
    bool? pageLoading,
  })=_MyLawyersState;

  factory MyLawyersState.initial({
    FormStatus status =const FormStatus.initial(),
    bool pageLoading=false
  })=> MyLawyersState(status: status,pageLoading: false);
}