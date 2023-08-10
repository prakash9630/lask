import 'package:lask_client/app_config.dart';
import 'package:lask_client/app_starter.dart';

Future<void> main() async {
  await appConfig(() =>  AppStarter());
}
