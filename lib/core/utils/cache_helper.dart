import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPre;
  static init() async {
    sharedPre = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(String key, dynamic val) async {
    return await sharedPre!.setBool(key, val);
  }

  static bool? getData({required String key}) {
    return sharedPre?.getBool(key);
  }
}
