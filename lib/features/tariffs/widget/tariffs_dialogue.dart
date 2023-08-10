import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/model/product_model.dart';
import 'package:lask_client/features/tariffs/widget/tariffs_options_view.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/colors.dart';
import '../model/tariffs_model.dart';
import '../provider/tariffs_notifier.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanModel {
  Tariffs tariffs;
  ProductModel? product;
  WidgetRef ref;
  BuildContext dialogContext;
  PlanModel(
      {required this.tariffs,
      this.product,
      required this.ref,
      required this.dialogContext});
}

void showTariffDialog(BuildContext context,
    {required Function(PlanModel planModel) onConfirmPlan}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
    ),
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
          height: 700.h,
          child: TariffDialogue(
            onConfirmPlan: onConfirmPlan,
          ),
        ),
      );
    },
  );
}

class TariffDialogue extends ConsumerStatefulWidget {
  const TariffDialogue({Key? key, required this.onConfirmPlan})
      : super(key: key);
  final Function(PlanModel planModel) onConfirmPlan;

  @override
  ConsumerState<TariffDialogue> createState() => _TariffDialogueState();
}

class _TariffDialogueState extends ConsumerState<TariffDialogue> {
  int? selectedIndex;
  int flag = 0;
  Tariffs? tariffs;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (flag == 0) {
      await ref.read(tariffsNotifyProvider.notifier).getTariffs().then((value) {
        setState(() {
          flag == 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tariffsProv = ref.watch(tariffsNotifyProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, top: 10),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      children: [
                        const Center(
                            child: Text(
                          "Choose Tariff",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.filterHeaderColor),
                        )),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                            ))
                      ],
                    ),
                  ),
                  textW400S14(
                      label:
                          "Choose one of these tariff plans to continue the call"),
                  const SizedBox(
                    height: 25,
                  ),
                  if (tariffsProv.tariffs != null)
                    ...List.generate(tariffsProv.tariffs!.length, (index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              tariffs = tariffsProv.tariffs![index];
                            });
                            if (tariffs != null) {
                              if (context.mounted) {
                                widget.onConfirmPlan(PlanModel(
                                    tariffs: tariffs!,
                                    ref: ref,
                                    dialogContext: context));
                              }
                            }
                          },
                          child: TariffsOptionsView(
                            isSelected: selectedIndex == index,
                            tariffs: tariffsProv.tariffs![index],
                          ));
                    })
                  else
                    const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 20),
          //     child: CustomButton(
          //       onPressed: () async {
          //         if (tariffs != null) {
          //           if (context.mounted) {
          //             widget.onConfirmPlan(PlanModel(
          //                 tariffs: tariffs!,
          //                 ref: ref,
          //                 dialogContext: context));
          //           }
          //         } else {
          //           showErrorToast(text: "Please select plan");
          //         }
          //       },
          //       label: "Confirm Plan",
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
