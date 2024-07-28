import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static final storage = new FlutterSecureStorage();

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    return await sharedPreferences?.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  static Future<bool?> clearData({required String key}) async {
    return await sharedPreferences?.remove(key);
  }
}
