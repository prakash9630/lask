import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/base_page/pages/terms_conditon_wrapper.dart';
import 'package:lask_client/features/base_page/widget/custom_drawer.dart';
import 'package:lask_client/firebase/firebase_service.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../../../core/consts/asset_path.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../contact_us/provider/contact_us_notifier.dart';
import '../../edit_profile/provider/edit_profile_notifier.dart';
import '../../home_page/provider/home_page_notifier.dart';
import '../../profile/provider/profile_provider.dart';
import '../provider/bottom_nav_provider.dart';
import '../provider/drawer_provider.dart';

@RoutePage()
class BasePage extends ConsumerStatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  ConsumerState<BasePage> createState() => _BasePageState();
}

class _BasePageState extends ConsumerState<BasePage> {
  int flag = 0;
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setUpInteractMessage(context);
    notificationServices.getDeviceToken().then((value){
      print("device token :$value");
    } );
    // initializeOneSignal();
    super.initState();
  }
  initializeOneSignal() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      event.complete(event.notification);
    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      context.router.push(const NotificationRoute());
    });
    OneSignal.shared.setAppId("e487bd0b-856a-4c11-b08c-00b5071b0e21");
    OneSignal.shared.setExternalUserId(ref.read(profileProvider).model!.externalId!);
     print(ref.read(profileProvider).model!.externalId!);
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (flag == 0) {
      await ref
          .read(profileProvider)
          .getData(deviceId: await notificationServices.getDeviceToken())
          .then((value) async {
        initializeOneSignal();
        await Future.wait([
          ref.watch(homePageNotifyProvider.notifier).getClientDashboard(),
          ref.read(drawerProvider).getPages(),
        ]);
        ref
            .read(contactUsNotifyProvider.notifier)
            .setInitialData(ref.read(profileProvider).model);

        ref.read(editProfileNotifyProvider.notifier).setInitialData(
            ref.read(profileProvider.notifier).model,
            ref.read(profileProvider.notifier).deviceId,);
      });
      flag = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    var bottomProv = ref.watch(navProvider);
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
            label: context.loc.areYouSureWantToExit,
            onPressed: () => exit(0),
            btnText: context.loc.exit,
          ),
        );
        return false;
      },
      child: TermsConditonWrapper(
        child: Scaffold(
          drawer: const CustomDrawer(),
          body: bottomProv.getItem(),
          // floatingActionButtonLocation:
          // FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0.0
          //     ? FloatingActionButton(
          //         heroTag: null,
          //         backgroundColor: AppColors.primaryColor,
          //         onPressed: () {
          //           context.router.push(const TariffsRoute());
          //         },
          //         child: SvgPicture.asset(
          //           AssetPath.callIcon,
          //         ))
          //     : null,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 4.0,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              backgroundColor: AppColors.primaryColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: bottomProv.navIndex,
              fixedColor: AppColors.whiteColor,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 11.0),
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 11.0),
              unselectedItemColor: AppColors.whiteColor,
              onTap: (index) async {
                bottomProv.changeNavIndex(index);
              },
              items: List.generate(
                bottomProv.navItems.length,
                (index) => BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: SvgPicture.asset(
                      AssetPath.getHomeIcons(index, bottomProv.navIndex),
                      height: 24.0,
                      width: 24.0,
                    ),
                  ),
                  label: bottomProv.getLabel(index).name,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
