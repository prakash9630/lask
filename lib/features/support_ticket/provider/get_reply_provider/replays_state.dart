

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/model/form_status.dart';
import '../../../../core/network/api_base.dart';
import '../../model/support_ticket_reply_model.dart';
part 'replays_state.freezed.dart';

@freezed
class ReplaysState with _$ReplaysState{
  const factory ReplaysState({
    required FormStatus status,
    required bool pageLoading,
    SupportTicketReplyMeta? model,
    List<SupportTicketReplyModel>? replyList,
    Failure? failure,
})=_ReplaysState;

  factory ReplaysState.initial({
     FormStatus status=const FormStatus.initial(),
    bool pageLoading=false
  })=> ReplaysState(
status: status,
pageLoading: pageLoading);

}