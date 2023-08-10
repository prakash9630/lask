
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/support_ticket/widget/support_view.dart';
import 'package:lask_client/widgets/custom_sliver_app_bar.dart';
import '../provider/support_notifier.dart';
import '../widget/support_simmer.dart';

@RoutePage()
class SupportTicketPage extends ConsumerStatefulWidget {
  const SupportTicketPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SupportTicketPage> createState() => _SupportTicketPageState();
}

class _SupportTicketPageState extends ConsumerState<SupportTicketPage> {
  int flag=0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(flag==0){
      ref.read(supportNotifyProvider.notifier).getData();
      setState(() {
        flag=1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final supportProv= ref.watch(supportNotifyProvider);
    return CustomSliverAppBar(
       isPageable: true,
        onNotification: ref.read(supportNotifyProvider.notifier).supportPageNotify,
        title: "Support Ticket",
        child: supportProv.status.maybeWhen(
          success: (){
            return Column(
              children: [
                ...List.generate(supportProv.supports!.length, (index){
                  return SupportView(model: supportProv.supports?[index],);
                })
              ],
            );
          },
    orElse: () => const SupportSimmer()
    ));
  }
}
