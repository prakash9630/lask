
import 'dart:developer';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/support_ticket/widget/reply_simmer.dart';
import 'package:lask_client/features/support_ticket/widget/support_reply_info_card.dart';
import 'package:lask_client/widgets/custom_sliver_app_bar.dart';
import '../../../calls/widgets/chat_detail_send_widget.dart';
import '../../../helper/utils/bot_toast.dart';
import '../model/support_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provider/get_reply_provider/get_reply_notifier.dart';
import '../repo/support_repo.dart';
import '../widget/support_reply_bubble.dart';
import '../widget/support_view.dart';

@RoutePage()
class SupportTicketReplyPage extends ConsumerStatefulWidget {
  const SupportTicketReplyPage({Key? key, required this.model})
      : super(key: key);
  final Support model;

  @override
  ConsumerState<SupportTicketReplyPage> createState() =>
      _SupportTicketReplyPageState();
}

class _SupportTicketReplyPageState
    extends ConsumerState<SupportTicketReplyPage> {
  int flag = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (flag == 0) {
      ref.read(replayNotifyProvider.notifier).getData(id: widget.model.id!);
      flag = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final replayProv = ref.read(replayNotifyProvider.notifier);
    final replyState = ref.watch(replayNotifyProvider);
    return CustomSliverAppBar(
      title: "Support Detail",
      isPageable: true,
      onRefresh: () => ref
          .refresh(replayNotifyProvider.notifier)
          .getData(id: widget.model.id!),
      onNotification: (notify) {
        return replayProv.replyPageNotifier(notify, widget.model.id!);
      },
      bottomSheet: widget.model.ticketStatus == SupportTicketsStatus.open
          ? ChatDetailSendWidget(
              allowMultiple: true,
              onSendMultipleFile: (text, files) async {
                FocusScope.of(context).unfocus();
                var data = {
                  "message": text,
                };
                ref.read(supportRepoProvider)
                    .getTicketSendReplies(data: data,
                    attachments: files,
                    id: widget.model.id!)
                    .then((value) {
                      value.fold((l) {
                        showErrorToast(text: "Error");
                      }, (r) {
                        replayProv.getData(id: widget.model.id!);
                      });
                });
              },
            )
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 20.h,bottom: 15.h),
                child: SupportReplyInfoCard(model: widget.model)),
            replyState.status.maybeWhen(
                success: () {
                  return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 85.h),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: replyState.replyList?.length,
                      itemBuilder: (_, index) {
                        return SupportReplyBubble(
                          model: replyState.replyList?[index],
                          index: index,
                        );
                      });
                },
                orElse: () => const ReplySimmer())
          ],
        ),
      ),
    );
  }
}
