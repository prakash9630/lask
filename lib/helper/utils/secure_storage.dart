import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static setData(
      String key,
      String value,
      ) async {
    await const FlutterSecureStorage().write(key: key, value: value);
  }

  static Future<String?> getData(String key) async {
    return await const FlutterSecureStorage().read(key: key);
  }

  static deleteData(String key) {
    const FlutterSecureStorage().delete(key: key);
  }

  static deleteAll() {
    const FlutterSecureStorage().deleteAll();
  }
}
