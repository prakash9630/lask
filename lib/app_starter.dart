
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/provider/language_provider.dart';
import 'core/routes/app_routes.dart';
import 'core/services/service_locator.dart';
import 'locolization/suported_language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStarter extends ConsumerWidget {
   AppStarter({Key? key}) : super(key: key);
   final AppRouter appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var locale = ref.watch(langProvider);
    return ScreenUtilInit(
      designSize: const Size(414, 921),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
      return MaterialApp.router(
          title: 'Lask-Client',
          debugShowCheckedModeBanner: false,
          locale: locale,
          builder: BotToastInit(),
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          localizationsDelegates: const [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales:locals
      );
    },

    );
  }
}
