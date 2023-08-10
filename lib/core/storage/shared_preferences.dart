import 'dart:convert';
import 'package:lask_client/core/storage/secure_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';
import '../services/service_locator.dart';

void storeString(String key, String value) {
  getIt<SharedPreferences>().setString(key, value);
}

String? getString(String key) {
  return getIt<SharedPreferences>().getString(key);
}

void storeBool(String key, bool value) {
  getIt<SharedPreferences>().setBool(key, value);
}

bool? getBool(String key) {
  return getIt<SharedPreferences>().getBool(key);
}

void removeKey(String key) {
  getIt<SharedPreferences>().remove(key);
}

void clearData() {

  getIt<AppRouter>().replaceAll(const [LoginRoute()]);
  SecureStorage.deleteAll();
  getIt<SharedPreferences>().clear();
  OneSignal.shared.removeExternalUserId();
}

void storeDynamicModel(String key, dynamic value) {
  String data = jsonEncode(value);
  getIt<SharedPreferences>().setString(key, data);
}

T? getDynamicModel<T>({
  required dynamic T,
  required String key,
  required Function
      fromJson, // fromJson is model fromJson function which convert jsonModel to model
}) {
  try {
    Map<String, dynamic> dynamicData =
        json.decode(getIt<SharedPreferences>().getString(key)!);
    return fromJson(dynamicData);
  } catch (error) {
    return null;
  }
}
