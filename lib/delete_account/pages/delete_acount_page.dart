
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/core/storage/shared_preferences.dart';
import 'package:lask_client/delete_account/repo/delete_account_repo.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_page_holder.dart';

@RoutePage()
class DeleteAccountPage extends ConsumerWidget {
   DeleteAccountPage({Key? key}) : super(key: key);

  final TextEditingController passController= TextEditingController();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return CustomPageHolder(title: "Delete Account",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:23),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22,bottom:10 ),
                  child: textW600S18(label: "Do you really want to delete your LASK account?"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10 ),
                  child: textW400S14(label: "Deleting your account leads to permanent deletion of all your user data from the LASK platform.",
                  color: AppColors.lightGreyColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 30),
                  child: Image.asset(AssetPath.deleteAccountImg,fit:BoxFit.cover,),
                ),

                textFieldPadding(
                  bottomPadding: 15,
                  child: RichText(
                    text: const TextSpan(
                      text: "Please type your password here and click ",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.lightGreyColor,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400
                      ),
                      children: [
                        TextSpan(
                          text: "“Delete My Account”",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: "Inter",
                              color: AppColors.lightGreyColor

                          ),
                        ),
                        TextSpan(
                          text: "button to delete your account permanently.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: "Inter",
                              color: AppColors.lightGreyColor

                          ),
                        )
                      ],
                    ),
                  ),
                ),

                 textFieldPadding(
                bottomPadding: 30 ,
                  child:  CustomTextField(labelText: '',
                  controller: passController,
                  hintText: "Enter your password",),
                ),
                textFieldPadding(
                  bottomPadding: 30 ,
                  child:  CustomButton(onPressed: () async{
                    final response= await ref.read(deleteAccountRepoProvider).deleteAccount(
                      {"password":passController.text}
                    );
                    response.fold((l) {
                       showErrorToast(text: l.message);
                    }, (r) {
                       showToast(text: r['detail']??"Account Deleted Successfully");
                       clearData();
                       context.router.popAndPush(const LoginRoute());
                    });
                  }, label: 'Delete My Account',),
                )
              ],
            ),
          ),
        ));
  }
}
