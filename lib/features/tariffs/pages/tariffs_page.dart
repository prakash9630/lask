import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/tariffs/model/tariffs_model.dart';
import 'package:lask_client/features/tariffs/widget/tariffs_view.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../components/custom_search_fields.dart';
import '../../../core/routes/app_routes.dart';
import '../../../widgets/custom_sliver_app_bar.dart';
import '../provider/tariffs_notifier.dart';
import '../widget/tariffs_shimmer.dart';

@RoutePage()
class TariffsPage extends ConsumerStatefulWidget {
  const TariffsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TariffsPage> createState() => _TariffsPageState();
}

class _TariffsPageState extends ConsumerState<TariffsPage> {
  int flag = 0;
  Tariffs? tariffs;
  List<Tariffs> tariffsList = [];

  @override
  void didChangeDependencies() {
    if (flag == 0) {
      setState(() {
        ref.read(tariffsNotifyProvider.notifier).getTariffs();
        flag == 1;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tariffsProv = ref.watch(tariffsNotifyProvider);
    final tariffsNotifyProv = ref.read(tariffsNotifyProvider.notifier);
    return CustomSliverAppBar(
      title: "Tariffs",
      isPageable: true,
      onNotification: tariffsNotifyProv.tariffsPaginationNotifier,
      onRefresh: () {
        ref.refresh(tariffsNotifyProvider.notifier).getTariffs();
      },
      bottomNavBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomButton(
                onPressed: () {
                  if (tariffs != null) {
                    context.router.push(CallRoute(tariffsId: tariffs!.id!));
                  } else {
                    showErrorToast(text: "Please select plan");
                  }
                },
                label: 'Confirm Plan',
              ),
            ),
            textW400S14(
                label: "*Tariff rate is subject to change",
                color: AppColors.lightGreyColor)
          ],
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: tariffsProv.status.maybeWhen(
              success: () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22, bottom: 10),
                      child: textW600S18(label: "Our Latest Tariffs Rates"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: textW400S14(
                          label:
                              "The tariff rate is subject to change any time without prior notice so make sure before making the call by reading on the screen.",
                          color: AppColors.lightGreyColor),
                    ),
                    textFieldPadding(
                      child: CustomSearchField(
                        hintText: "Search tariffs",
                        onSubmitted: (v) {
                          setState(() {
                            tariffsList = tariffsProv.tariffs!
                                .where((element) => element.name!
                                    .toLowerCase()
                                    .contains(v!.toLowerCase()))
                                .toList();
                            if (tariffsList.isEmpty) {
                              showErrorToast(text: "Tariffs not found.");
                            }
                          });
                        },
                      ),
                    ),
                    if (tariffsList.isNotEmpty)
                      ...List.generate(tariffsList.length, (idx) {
                        return GestureDetector(
                            onTap: () {
                              tariffsNotifyProv.selectedIndex(idx);
                              tariffs = tariffsList[idx];
                            },
                            child: TariffsView(
                              selectedIndex: tariffsProv.selectedIndex == idx,
                              tariffs: tariffsList[idx],
                            ));
                      })
                    else
                      ...List.generate(tariffsProv.tariffs!.length, (idx) {
                        return GestureDetector(
                            onTap: () {
                              tariffsNotifyProv.selectedIndex(idx);
                              tariffs = tariffsProv.tariffs![idx];
                            },
                            child: TariffsView(
                              selectedIndex: tariffsProv.selectedIndex == idx,
                              tariffs: tariffsProv.tariffs![idx],
                            ));
                      }),
                    if (tariffsProv.pageLoading == true) loadingView()
                  ],
                );
              },
              orElse: () => const TariffsShimmer())),
    );
  }
}
