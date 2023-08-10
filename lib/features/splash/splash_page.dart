import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/storage/shared_preferences.dart';
import '../../core/consts/asset_path.dart';
import '../../core/routes/app_routes.dart';
import '../../core/storage/secure_storage.dart';
import '../../core/storage/shared_constants.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  initApp() async {
    Future(() async {
      bool? isRemember = getBool(SharedConstants.remember);
      bool isToken =
          await SecureStorage.getData(SharedConstants.access) != null;
      if (isRemember==true) {
        if (isToken) {
          return true;
        }
      }
      return false;
    }).then((value) {
      if (value) {
        AutoRouter.of(context).push(const BaseRoute());
      } else {
        AutoRouter.of(context).push(const LoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetPath.logoWithTitle,
        ),
      ),
    );
  }
}
