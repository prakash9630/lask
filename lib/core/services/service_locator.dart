import 'package:lask_client/core/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_manager.dart';
import 'package:get_it/get_it.dart';

GetIt getIt= GetIt.instance;
Future<void> serviceLocator()async{
  var sp= await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sp);
  getIt.registerSingleton<ApiManager>(ApiManager());
  getIt.registerSingleton<AppRouter>(AppRouter());
}