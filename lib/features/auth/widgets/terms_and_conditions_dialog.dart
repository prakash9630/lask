import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/auth/widgets/terms_text_row.dart';

import '../screens/create_account_page.dart';
import 'curve_container.dart';


final termsListProvider = StateProvider<List<String>>((ref) {
  return [
    "You are entitled to an Independent Lawyer position and agree to work on a phone counselling service at a 25 Euro per hour rate",
    "Your major responsibility is to talk through the apps on voice, video or by shortmessage (clients prefer over the phone).",
    "You are entitled to check your monthly gross income (before tax) in the app, the payment of previous months will be processed until the day of 15 of next month.",
    "As you are an independent professional you are liable to pay income tax, salary tax or any kind of tax to the government, your association, or respective authorities on time.",
    "You must have at least one android phone or tab or an iPhone or I tab with a smart feature min 8 Mxp back +5 Mxp front camera not more than 5-year old.",
    "A 5 Star ranking policy will be adopted to maintain quality service. If your rank is less than 3 out of 5 for a month you will be suspended for one month.",
    "If the rank does not go up in that period, you will be prohibited to work anymore and it will be considered as a breach of the policy and this agreement will be deactivated, terminated, revoked forever.",
    "You are not allowed to maintain personal relation, sharing contact details, e.g., sharing phone, emails, social media, your and our location, your and our office address or intent to personal visit with the clients. If any proof, subject to discovery by admin, is found by any chance or any time, you will bedeactivated, terminated, revoked from our agreement forever.",
    "You must maintain a working environment to be online and work as you are not allowed to be online while driving, riding, doing an exercise or in noise, crowded areas or any other conditions not conducive to clear audio communication.",
    "You are not allowed to be online while using or until with its effects, e.g., alcohol, drugs, or any kind of intoxicating liquid or solid, subject to report to related authority for further legal action.",
    "You will be ranked by 100 clients up to 5 stars by making after every conversation, if your score fails down less than 3 star out of 5, your account will be automatically deactivated, suspended and revoked.",
    "Lawyer agrees to strive to reply to the client on the call related to received documents if possible and only resort to offline document analysis when strictly necessary.",
  ];
});

class TermsAndConditionDialog extends ConsumerWidget {
  const TermsAndConditionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termsList = ref.watch(termsListProvider);

    return WillPopScope(
      onWillPop: () async {
        ref
            .read(
              isBottomSheetOpenedProvider.notifier,
            )
            .update(
              (state) => false,
            );
        return true;
      },
      child: CurveContainer(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 23,
            vertical: 20,
          ),
          children: [
            Row(
              children: [
                const Text(
                  "Terms & Conditions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    ref.read(isBottomSheetOpenedProvider.notifier).update(
                          (state) => false,
                        );
                    context.popRoute();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "FRANCISCO IS MAKING",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            const Text(
              "\n*********************************\n• You Means Lawyer,\n• Yours means lawyer's\n• Us Means Our company, Vision Talk Lda",
            ),
            const SizedBox(
              height: 5,
            ),
            ...List.generate(
              termsList.length,
              (index) => TermsTextRow(
                count: index + 1,
                data: termsList[index],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "The lawyer must send a signed and certified (by notary, solicitor, or lawyer) hard copy to the headquarters of the Lask company.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
