import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/my_card/provider/card_provider.dart';
import 'package:lask_client/features/my_card/repo/my_card_repo.dart';
import 'package:lask_client/features/my_card/widget/card_view.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_page_holder.dart';
import '../../../helper/utils/bot_toast.dart';
import '../../../widgets/add_card_dialog.dart';
import '../widget/my_card_simmer.dart';

@RoutePage()
class MyCardPage extends ConsumerStatefulWidget {
  const MyCardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends ConsumerState<MyCardPage> {
   bool showCard=false;
  @override
  Widget build(BuildContext context) {
    final cardProv = ref.watch(myCardListProvider);
     ref.listen(myCardListProvider, (previous, next) {
       next.when(data:(data){
         if(data!.data!.isNotEmpty){
           setState(() {
             showCard=false;
           });
         }else{
           setState(() {
             showCard=true;
           });
         }

       }, error: (a,b){}, loading:(){});
     });

    return CustomPageHolder(
        floatingActionButton: showCard
            ? FloatingActionButton(
                backgroundColor: AppColors.primaryColor,
                child: const Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {
                  showCardDialog(context, onCardSave: (token) {
                    ref
                        .read(myCardRepoProvider)
                        .cardCreate(token)
                        .then((value) {
                      if (value) {
                        showToast(text: 'Card added successfully');
                        ref.refresh(myCardListProvider);
                      }
                    });
                  });
                },
              )
            : null,
        title: "My Cards",
        child: cardProv.when(
            data: (data) {
              if (data!.data!.isNotEmpty) {
                return ListView.builder(
                    itemCount: data.data?.length,
                    itemBuilder: (_, index) {
                      return CardView(data: data.data![index]);
                    });
              } else {

                return Center(
                  child: textW500S16(
                      label: "No Card found.", color: AppColors.black2CColor),
                );
              }
            },
            error: (obj, stack) {
              return const Center(child: Text("Error"));
            },
            loading: () => const MyCardSimmer()));
  }
}
