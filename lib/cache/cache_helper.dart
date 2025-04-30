import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  /// تهيئة SharedPreferences - لازم تناديها في main()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// حفظ أي نوع من البيانات (String, int, bool, double)
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (_prefs == null) return false;

    if (value is String) return await _prefs!.setString(key, value);
    if (value is int) return await _prefs!.setInt(key, value);
    if (value is bool) return await _prefs!.setBool(key, value);
    if (value is double) return await _prefs!.setDouble(key, value);
    if (value is List<String>) return await _prefs!.setStringList(key, value);

    return false;
  }

  /// قراءة البيانات من التخزين
  static dynamic getData({required String key}) => _prefs?.get(key);

  static String? getString(String key) => _prefs?.getString(key);
  static int? getInt(String key) => _prefs?.getInt(key);
  static bool? getBool(String key) => _prefs?.getBool(key);
  static double? getDouble(String key) => _prefs?.getDouble(key);
  static List<String>? getStringList(String key) => _prefs?.getStringList(key);

  /// حذف بيانات معينة
  static Future<bool> removeData({required String key}) async {
    return await _prefs!.remove(key);
  }

  /// حذف كل البيانات (مثلاً عند تسجيل الخروج)
  static Future<bool> clearAll() async {
    return await _prefs!.clear();
  }
}
