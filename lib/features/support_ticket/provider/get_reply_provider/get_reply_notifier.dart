import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/support_ticket/provider/get_reply_provider/replays_state.dart';
import 'package:lask_client/features/support_ticket/repo/support_repo.dart';
import '../../model/support_ticket_reply_model.dart';

final replayNotifyProvider =
    StateNotifierProvider<GetReplyNotifier, ReplaysState>((ref) {
  return GetReplyNotifier(ref);
});

class GetReplyNotifier extends StateNotifier<ReplaysState> {
  GetReplyNotifier(this.ref) : super(ReplaysState.initial());
  Ref ref;
  SupportTicketReplyMeta? model;
  List<SupportTicketReplyModel> replyList=[];

  bool replyPageNotifier(ScrollEndNotification scrollEndNotification,int id) {
    if (scrollEndNotification.metrics.pixels ==
        scrollEndNotification.metrics.maxScrollExtent) {
      if (state.model?.next != null) {
        getData(url: state.model?.next, id: id);
      }
    }
    return true;
  }

  Future<void> getData({String? url, required id}) async {
    final response =
        await ref.read(supportRepoProvider).getTicketReplies(id: id, url: url);
    if (url == null) {
      state = response.fold((l) {
        return state.copyWith(
            pageLoading: false, failure: l, status: const FormStatus.error());
      }, (r) {
        model = SupportTicketReplyMeta.fromJson(r);
        replyList = model?.results ?? [];
        return state.copyWith(
            pageLoading: false,
            model: model,
            replyList: replyList,
            status: const FormStatus.success());
      });
    } else {
      state = response.fold((l) {
        return state;
      }, (r) {
        model = SupportTicketReplyMeta.fromJson(r);
        replyList.addAll(model?.results ?? []);
        return state.copyWith(
            pageLoading: true,
            model: model,
            replyList: replyList,
            status: const FormStatus.success());
      });
      state=state.copyWith(pageLoading: false);
    }
  }
}
