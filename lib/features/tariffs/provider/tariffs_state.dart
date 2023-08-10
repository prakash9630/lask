

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/tariffs/model/tariffs_model.dart';
part 'tariffs_state.freezed.dart';

@freezed
abstract class TariffsState with _$TariffsState{
  const factory TariffsState({
    required FormStatus status,
    required bool pageLoading,
    TariffsModel? model,
    List<Tariffs>? tariffs,
    Failure? failure,
    int? selectedIndex,
})=_TariffsState;
  factory TariffsState.initial({
    FormStatus status=const FormStatus.initial(),
    bool pageLoading= false,

})=> TariffsState(status: status, pageLoading: pageLoading);
}