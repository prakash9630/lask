import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/storage/shared_constants.dart';
import 'package:lask_client/core/storage/shared_preferences.dart';
import 'package:lask_client/features/base_page/model/pages_model.dart';

import '../../../core/routes/app_routes.dart';
import '../model/drawer_menu.dart';
import '../model/language_model.dart';
import '../repo/pages_repo.dart';

final drawerProvider = ChangeNotifierProvider<DrawerProvider>((ref) {
  return DrawerProvider(ref);
});

class DrawerProvider extends ChangeNotifier {
    DrawerProvider(this.ref);
    final Ref ref;
  int? lanIndex = getString(SharedConstants.lang) != "en" ? 1 : 0;
   List<Pages> page=[];
  List<DrawerMenu> functionMenu = [
    DrawerMenu(
        title: "Share App Now",
        icon: AssetPath.iconShare,
        // page: const OurServicesRoute()

    ),
    DrawerMenu(
        title: "Our Services",
        icon: AssetPath.iconService,
        page:  OurServicesRoute()),
    DrawerMenu(
        title: "Tariffs",
        icon: AssetPath.iconTariffs,
        page: const TariffsRoute()),

    DrawerMenu(
        title: "Lask Call",
        icon: AssetPath.callIcon,
        page: const CallLawyerRoute()),
  ];

  List<DrawerMenu> infoMenu = [
    DrawerMenu(
        title: "About Us",
        icon: AssetPath.iconAboutUs,
        page: const AboutUsRoute()
    ),
    DrawerMenu(
        title: "Contact Us",
        icon: AssetPath.iconContactUs,
        page: const ContactUsRoute()),
    DrawerMenu(
        title: "FAQs",
        icon: AssetPath.iconFaqs,
        page: const FaqsRoute()),

    DrawerMenu(
        title: "Support Ticket",
        icon: AssetPath.supportIcon,
        page: const SupportTicketRoute()),
  ];
  List<LanguageModel> lang = [
    LanguageModel(label: "ENG", isEnglish: true, index: 0),
    LanguageModel(label: "PT", isEnglish: false, index: 1),
  ];

  setLangIndex(int index) {
    lanIndex = index;
    notifyListeners();
  }

   Future<void> getPages()async{
    final response= await ref.read(pagesRepoProvider).getPages();
    response.fold((l) => null, (r){
        page= PagesModel.fromJson(r).pages??[];
        notifyListeners();
    });
  }
}
