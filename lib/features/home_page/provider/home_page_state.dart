
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/home_page/model/hompage_model.dart';
part 'home_page_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState{
  const factory HomePageState({
    required FormStatus status,
    Failure? failure,
    HomePageModel? model,
    List<RecentCalls>? recentCalls
})=_HomePageState;

  factory HomePageState.initial({
    FormStatus status=const FormStatus.initial()

})=>HomePageState(status: status);
}