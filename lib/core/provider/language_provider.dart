
import 'dart:ui';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../storage/shared_constants.dart';
import '../storage/shared_preferences.dart';

final langProvider = StateProvider<Locale>((ref) {
  return Locale(getString(SharedConstants.lang)??"eng");
});


//
// final languageProvider = StateNotifierProvider<LanguageProvider, Locale>((ref) {
//   return LanguageProvider();
// });
// // final languageProvider = StateProv/ider<>((ref) => LanguageProvider());
//
// class LanguageProvider extends StateNotifier<Locale> {
//   LanguageProvider() :super(const Locale("en")) {
//     void initialLanguage() {
//       state = Locale(getString(SharedConstants.lang)??"en");
//     }
//
//     void changeLanguage(bool isEnglish) {
//       state = Locale("en");
//     }
//   }
// }