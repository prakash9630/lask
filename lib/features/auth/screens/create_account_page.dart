import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/features/auth/model/forgot_password_model.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';


import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../helper/utils/validators.dart';
import '../provider/forgot_password_provider/forgot_password_notifier.dart';
import '../repo/auth_repo.dart';
import '../widgets/widgets.dart';
import 'auth_base_page.dart';

final termsAndConditionProvider = StateProvider<bool>((ref) {
  return false;
});

final isBottomSheetOpenedProvider = StateProvider<bool>((ref) {
  return false;
});

@RoutePage()
class CreateAccountPage extends HookConsumerWidget {
   CreateAccountPage({Key? key}) : super(key: key);
  final TextEditingController emailController= TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.loc;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isTermAccepted = ref.watch(termsAndConditionProvider);
    final isOpenedSheet = ref.watch(isBottomSheetOpenedProvider);
    ref.listen(forgotPasswordProvider, (previous, next) {
      next.status.maybeWhen(orElse: (){},success: (){
        AutoRouter.of(context).push(
          OtpRoute(
            model: next.model,
            isFromForgotPassword: false,
          ),
        );
      });
    });

    return Scaffold(
      body: AuthBasePage(
        image: AssetPath.signUp,
        imageHeight: 415,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 23,
              vertical: 33,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.createAnAccount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  l10n.registerWithYourEmail,
                  style: const TextStyle(
                    color: AppColors.lightFontGrey,
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                CustomTextField(
                  labelText: l10n.email,
                  hintText: l10n.enterEmailAddress,
                  validator: Validators.email,
                  controller:emailController,
                  showRequired: true,
                ),
                const SizedBox(
                  height: 21,
                ),
                Builder(
                  builder: (context) {
                    return InkWell(
                      onTap: isTermAccepted
                          ? null
                          : () {
                              ref
                                  .read(isBottomSheetOpenedProvider.notifier)
                                  .update(
                                    (state) => true,
                                  );
                              showBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const TermsAndConditionDialog();
                                },
                                // isDismissible: true,
                                // isScrollControlled: true,
                                // useSafeArea: true,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.8,
                                ),
                                enableDrag: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.0),
                                  ),
                                ),
                              );
                            },
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: isTermAccepted
                                    ? AppColors.secondaryColor
                                    : AppColors.fontGrey,
                                width: 1.2,
                              ),
                              color: isTermAccepted
                                  ? AppColors.secondaryColor
                                  : null,
                            ),
                            child: isTermAccepted
                                ? const Icon(
                                    Icons.check,
                                    size: 12,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: l10n.iAcceptAllThe,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.lightFontGrey,
                                  fontFamily: "Inter",
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${l10n.termsConditions}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: !isTermAccepted
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            final response = await ref.read(authRepo).emailRegister(body: {
                              "email":emailController.text
                            });
                            response.fold((l) {
                              showErrorToast(text: l.message);
                            }, (r){
                               final data= ForgotPassModel.fromJson(r);
                              context.router.popAndPush(OtpRoute(
                                isFromForgotPassword: false,
                                model: data
                              ));
                            });
                          }
                        },
                  label: l10n.continueText,
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const SocialLogin(),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      context.pushRoute(const LoginRoute());
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "${l10n.alreadyHaveAnAccount} ",
                        style: const TextStyle(
                          color: AppColors.fontGrey,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: l10n.login,
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: isOpenedSheet
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
              child: CustomButton(

                onPressed: () {
                  FocusScope.of(context).unfocus();
                  ref.read(termsAndConditionProvider.notifier).update(
                        (state) => true,
                      );
                  context.popRoute();
                },
                label: l10n.iAccept,
              ),
            )
          : null,
    );
  }
}
