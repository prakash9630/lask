
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/auth/model/forgot_password_model.dart';
import 'package:lask_client/features/auth/screens/reset_password_page.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:pinput/pinput.dart';
import '../../../components/custom_button.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../core/routes/app_routes.dart';
import '../provider/forgot_password_provider/forgot_password_notifier.dart';
import '../provider/signup_provider/signup_notifier.dart';
import '../repo/auth_repo.dart';
import '../widgets/widgets.dart';

@RoutePage()
class OtpPage extends HookConsumerWidget {
  const OtpPage({Key? key, this.isFromForgotPassword = false, this.model})
      : super(key: key);
  final bool isFromForgotPassword;
  final ForgotPassModel? model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final otpController = useTextEditingController();
    final forgotPassProv = ref.read(forgotPasswordProvider.notifier);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    var defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: -20.0,
            offset: Offset(
              -10,
              10,
            ),
          ),
        ],
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          l10n.otpVerification, style: const TextStyle(color: Colors.white),
          // style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
          //       color: Colors.white,
          //     ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 137,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: l10n.otpInfoDescription,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                        ),
                        children: [
                          TextSpan(
                            text: " ${model?.email}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    AssetPath.otp,
                    height: 137,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CurveContainer(
              child: Form(
                key: formKey,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
                  children: [
                    Text(
                      l10n.verifyYourEmail,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      l10n.otpVerifyEmailDesc,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.lightFontGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                        text: l10n.verificationCode,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.fontGrey,
                          fontFamily: "Inter",
                        ),
                        children: const [
                          TextSpan(
                            text: " *",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.red,
                              fontFamily: "Inter",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Pinput(
                      length: 6,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      focusedPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(
                          color: AppColors.red,
                        ),
                      ),
                      controller: otpController,
                      validator: (v) {
                        if (v == null || v.length != 6) {
                          return l10n.otpIsRequired;
                        }
                        return null;
                      },
                      defaultPinTheme: defaultPinTheme,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var body = {
                            "email": model?.email,
                            "token": otpController.text,
                            "key": model?.key
                          };
                          final response = await ref
                              .read(authRepo)
                              .emailValidation(body: body,isForgotPass: isFromForgotPassword);
                          response.fold((l) {
                            showErrorToast(text: l.message);
                          }, (r) {
                            if (isFromForgotPassword) {
                              context.pushRoute(
                                ResetPasswordRoute(
                                    arg: ResetPassPageArgs(
                                        isChangePassword: !isFromForgotPassword,
                                        key: model?.key,
                                        email: model?.email,
                                        token: otpController.text)),
                              );
                            } else {
                              ref.read(signupNotifyProvider.notifier)
                                ..onEmailChange(model?.email)
                                ..onKeyChange(model?.key);
                              context.pushRoute(
                                SignUpRoute(),
                              );
                            }
                          });
                        }
                      },
                      label: l10n.continueText,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: l10n.didnTReceiveCode,
                          style: const TextStyle(
                            color: AppColors.fontGrey,
                            fontFamily: "Inter",
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: " ${l10n.resendCode}",
                              style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
