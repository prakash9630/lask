import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/tariffs/model/tariffs_model.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/colors.dart';

class TariffsView extends ConsumerWidget {
  const TariffsView(
      {Key? key, required this.selectedIndex, required this.tariffs})
      : super(key: key);
  final bool selectedIndex;
  final Tariffs tariffs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: selectedIndex
                  ? Border.all(width: 1, color: AppColors.selectedBorderColor)
                  : null),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: tariffs.image ?? "",
                    height: 78,
                    width: 78,
                    placeholder: (context, url) {
                      return const CircularProgressIndicator();
                    },
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Icon(
                          Icons.person,
                          color: AppColors.whiteColor,
                          size: 40.0,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: textW600S14(
                          label: tariffs.name ?? "",
                          color: AppColors.black2CColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: textW500S11(label: "Plan Rate"),
                    ),
                    textW600S18(label: "€ ${tariffs.price.toString()}"),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: IgnorePointer(
                        ignoring: true,
                        child: Radio(
                            activeColor: AppColors.selectedBorderColor,
                            value: true,
                            groupValue: selectedIndex,
                            onChanged: (v) {}),
                      ),
                    ),
                    //const PopularStatus()
                  ],
                ),
              )
            ],
          )),
    );
  }
}
