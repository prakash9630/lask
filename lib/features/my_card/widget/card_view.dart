import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/my_card/model/card_model.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../../core/consts/asset_path.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../provider/card_provider.dart';
import '../repo/my_card_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/my_card_page.dart';

class CardView extends ConsumerWidget {
  const CardView({Key? key, required this.data}) : super(key: key);
  final CardDetail data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              children: [
                textW600S18(label: data.card?.brand?.toUpperCase() ?? ""),
                const Spacer(),
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialog(
                          key: key,
                          label:
                              "Are you sure, you want to delete card form your account.",
                          onPressed: () {
                            ref
                                .read(myCardRepoProvider)
                                .deleteCard(data.id!)
                                .then((value) {
                              if (value) {
                                showToast(text: "Card deleted successful.");
                                ref.refresh(myCardListProvider);
                              }
                            });
                          },
                          btnText: "Yes",
                        ),
                      );
                    },
                    child: SvgPicture.asset(AssetPath.deleteIcon))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(23.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetPath.cardImage,
                    ))),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AssetPath.cardChip),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: textW500S26(
                      label: "****   ****   ****   ${data.card?.last4}"),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: textW500S8(label: "VALID\nTHRU"),
                    ),
                    textW400S18(
                        label: "${data.card?.expMonth}/${data.card?.expYear}"),
                    const Spacer(),
                    Image.asset(data.card?.brand == "visa"
                        ? AssetPath.vidaCard
                        : data.card?.brand?.toLowerCase() == "mastercard"
                            ? AssetPath.masterCard
                            : data.card?.brand?.toLowerCase() ==
                                    "american express"
                                ? AssetPath.americanExpCard
                                : data.card?.brand?.toLowerCase() ==
                                        "Discover & Diners Club"
                                    ? AssetPath.discoverNDiners
                                    : data.card?.brand?.toLowerCase() ==
                                            "China UnionPay"
                                        ? AssetPath.chinaUnion
                                        : data.card?.brand?.toLowerCase() ==
                                                "Japan Credit Bureau (JCB)"
                                            ? AssetPath.japanCredit
                                            : data.card?.brand?.toLowerCase() ==
                                                    "Cartes Bancaires"
                                                ? AssetPath.cartes
                                                : data.card?.brand
                                                            ?.toLowerCase() ==
                                                        "eftpos"
                                                    ? AssetPath.eftpos
                                                    : AssetPath.cardImg)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
