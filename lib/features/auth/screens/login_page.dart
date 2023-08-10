import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/storage/shared_preferences.dart';
import 'package:lask_client/features/auth/provider/login_provider/login_notifier.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_check_box.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/storage/shared_constants.dart';
import '../../../helper/utils/validators.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../base_page/provider/bottom_nav_provider.dart';
import 'auth_base_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final rememberMeProvider = StateProvider<bool>((ref) {
  return getBool(SharedConstants.remember)??false;
});

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    bool rememberMe = ref.watch(rememberMeProvider);
    final loginProvState= ref.watch(loginProvider);
    final navProv= ref.watch(navProvider);

    final loginProv= ref.read(loginProvider.notifier);

    ref.listen(loginProvider, (previous, next) {
     next.status.maybeWhen(orElse:(){},success: (){
       context.router.popAndPush(const BaseRoute());
     });
    });

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
            label: l10n.areYouSureWantToExit,
            onPressed: () => exit(0),
            btnText: l10n.exit,
          ),
        );
        return false;
      },
      child: AuthBasePage(
        image: AssetPath.login,
        child: Form(
          key: formKey,
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 23.w,
              vertical: 33.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.loginWelcome,
                  style:  TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Text(
                  l10n.loginWelcomeDescription,
                  style: const TextStyle(
                    color: AppColors.lightFontGrey,
                  ),
                ),
                 SizedBox(
                  height: 23.h,
                ),
                CustomTextField(
                  labelText: l10n.email,
                  hintText: l10n.enterEmailAddress,
                  validator: Validators.isRequired,
                  controller: emailController,
                  showRequired: true,
                  onChanged: loginProv.onUserNameChanged,
                ),
                 SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                  labelText: l10n.password,
                  hintText: l10n.enterYourPassword,
                  validator: Validators.isRequired,
                  controller: passwordController,
                  isPassword: true,
                  onChanged: loginProv.onPassWordChanged,
                  showRequired: true,
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    CustomCheckbox(
                      initialValue: rememberMe,
                      label: l10n.rememberMe,
                      onChanged: (val) {
                        ref.read(rememberMeProvider.notifier).update((state) {
                          state = val;
                          storeBool(SharedConstants.remember,state);
                          return state;
                        });
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        AutoRouter.of(context)
                            .push(const ForgotPasswordRoute());
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          AppColors.primaryColor.withOpacity(0.1),
                        ),
                      ),
                      child: Text(
                        l10n.forgotPassword,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState!.validate()) {
                      navProv.changeNavIndex(0);
                      loginProv.login();
                    }
                  },
                  label: l10n.login,
                ),
                 SizedBox(
                  height: 25.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      context.pushRoute( CreateAccountRoute());
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "${l10n.newUser} ",
                        style:  TextStyle(
                          color: AppColors.fontGrey,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        children: [
                          TextSpan(
                            text: l10n.createAnAccount,
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
    );
  }
}
