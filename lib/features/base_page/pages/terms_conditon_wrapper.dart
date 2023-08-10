import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/profile/provider/profile_provider.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../profile/repo/profile_repo.dart';

class TermsConditonWrapper extends ConsumerWidget {
  const TermsConditonWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;

  Future<void> updateProfile(WidgetRef ref,Map<String,dynamic> data) async {
    final response =
        await ref.read(profileRepo).profileUpdate(map: data);
    response.fold((l){
      showErrorToast(text: "Fail accepting");
    }, (r) => {
    ref.watch(profileProvider).getData()
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileProv = ref.watch(profileProvider);
    return Stack(
      children: [
        child,
        if (profileProv.model != null &&
            (!profileProv.model!.tocAccepted || !profileProv.model!.ppAccepted))
          Scaffold(
            backgroundColor: AppColors.borderColor.withOpacity(0.5),
            body: Dialog(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textW600S18(
                          label: !profileProv.model!.tocAccepted
                              ? "Terms and Conditions"
                              : !profileProv.model!.ppAccepted
                                  ? "Privacy Policy"
                                  : ""),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 8),
                         child: Html(data: !profileProv.model!.tocAccepted?profileProv.model!.tocContent??"-":!profileProv.model!.ppAccepted?profileProv.model!.ppContent??"-":"-"),
                       ),
                       ButtonBar(
                         children: [
                           OutlinedButton(
                             style: OutlinedButton.styleFrom(
                               side: const BorderSide(
                                 color: AppColors.primaryColor,
                               ),
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(8.0),
                               ),
                             ),
                             onPressed: (){
                               exit(0);
                             },
                             child: const Text(
                               'CANCEL',
                               style: TextStyle(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 12.0,
                                 color: AppColors.primaryColor,
                               ),
                             ),
                           ),
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               backgroundColor: AppColors.primaryColor,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(8.0),
                               ),
                             ),
                             onPressed: () {
                               if(!profileProv.model!.tocAccepted){
                                 updateProfile(ref,{
                                   "toc_accepted":true
                                 });
                               }else if(!profileProv.model!.ppAccepted){
                                 updateProfile(ref,{
                                   "pp_accepted":true
                                 });
                               }
                             },
                             child: const Text(
                               "Accept",
                               style: TextStyle(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 12.0,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                         ],
                       )
                    ],
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
