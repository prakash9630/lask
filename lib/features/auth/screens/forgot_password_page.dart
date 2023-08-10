import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/features/auth/provider/forgot_password_provider/forgot_password_notifier.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../helper/utils/validators.dart';

@RoutePage()
class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.loc;
    final forgotPassProv= ref.read(forgotPasswordProvider.notifier);
    final formKey = useMemoized(() => GlobalKey<FormState>());

      ref.listen(forgotPasswordProvider, (previous, next) {
        next.status.maybeWhen(orElse: (){},success: (){
          AutoRouter.of(context).push(
            OtpRoute(
             model: next.model,
              isFromForgotPassword: true,
            ),
          );
        });
      });

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.primaryColor, // <-- SEE HERE
        ),
        centerTitle: true,
        titleTextStyle:const TextStyle(color: AppColors.headerBlack,fontWeight: FontWeight.w600,fontSize: 20),
        backgroundColor: AppColors.whiteColor,
        title: Text(l10n.forgotPassword,),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
          children: [
            Image.asset(
              AssetPath.forgotPassword,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              l10n.forgotPasswordTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              l10n.forgotPasswordDescription,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.lightFontGrey,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: "",
              hintText: l10n.enterEmailAddress,
              validator: Validators.email,
              onChanged: forgotPassProv.onEmailChange,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                    forgotPassProv.onForgotPassword();
                }
              },
              label: l10n.sendOtp,
            ),
          ],
        ),
      ),
    );
  }
}
