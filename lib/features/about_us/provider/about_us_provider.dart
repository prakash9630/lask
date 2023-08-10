
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/about_us_model.dart';
import '../repo/about_us_repo.dart';
part 'about_us_provider.g.dart';

@riverpod
Future<AboutUsModel?> aboutUs(AboutUsRef ref){
 ref.keepAlive();
 return ref.read(aboutUsRepoProvider).aboutUs();
}