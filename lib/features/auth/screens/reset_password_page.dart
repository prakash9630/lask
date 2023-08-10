import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_page_holder.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../core/enums/data_status.dart';
import '../../../core/routes/app_routes.dart';
import '../../../helper/utils/validators.dart';
import '../provider/reset_password_provider/reset_password_notifier.dart';
import '../widgets/curve_container.dart';

class ResetPassPageArgs {
  final bool isChangePassword;
  final String? token;
  final String? key;
  final String? email;

  ResetPassPageArgs(
      {this.isChangePassword = false, this.token, this.key, this.email});
}
@RoutePage()
class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({Key? key,required this.arg}) : super(key: key);

  final ResetPassPageArgs arg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.loc;
    final formKey = useMemoized(() => GlobalKey<FormState>());
     final resetPassProv= ref.watch(resetPassProvider);
     final  resetPassNotifyProv= ref.watch(resetPassProvider.notifier);

     ref.listen(resetPassProvider, (previous, next) {
       if(next.status==DataStatus.success){
         if(arg.isChangePassword){
           showToast(text: "Password updated Successfully");
         }else{
           showToast(text: "Password Reset Successfully");
         }
         AutoRouter.of(context).pushAndPopUntil(
           const LoginRoute(),
           predicate: (v) => false,
         );
       }
     });

    return CustomPageHolder(
        title: "Change Password",
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Image.asset(AssetPath.resetPassword),
              const SizedBox(height: 20),
              CurveContainer(
                  showShadow: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textW600S18(label: "Update your password"),
                        const SizedBox(
                          height: 10,
                        ),
                        textW400S14(
                            label:
                                "Note: Try to use alphanumeric characters for strong password",
                            color: AppColors.lightGreyColor),
                        const SizedBox(
                          height: 25,
                        ),
                        if(arg.isChangePassword==true)
                        textFieldPadding(
                          child: CustomTextField(
                            labelText: "Old Password",
                            showRequired: true,
                            isPassword: true,
                            hintText: l10n.enterYourNewPassword,
                            validator: Validators.password,
                            onChanged: resetPassNotifyProv.onOldPassChange,

                          ),
                        ),
                        textFieldPadding(
                          child: CustomTextField(
                            labelText: "New Password",
                            showRequired: true,
                            isPassword: true,
                            hintText: l10n.reEnterYourNewPassword,
                            validator: Validators.password,
                            onChanged: resetPassNotifyProv.onNewPassChange,
                          ),
                        ),
                        textFieldPadding(
                          bottomPadding: 30,
                          child: CustomTextField(
                            labelText: l10n.confirmNewPassword,
                            showRequired: true,
                            isPassword: true,
                            hintText: l10n.reEnterYourNewPassword,
                            validator: (v) => Validators.confirmPassword(
                              v,
                              resetPassProv.newPassword,
                            ),
                          ),
                        ),
                        CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                                if(arg.isChangePassword){
                                  resetPassNotifyProv.onPasswordUpdate();
                                }else{
                                  var data = {
                                    "email": arg.email,
                                    "password": resetPassProv.newPassword,
                                    "token": arg.token,
                                    "key": arg.key
                                  };
                                  resetPassNotifyProv.onPasswordReset(data);
                                }
                            }
                          },
                          label: arg.isChangePassword?l10n.updatePassword:l10n.resetPassword,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
