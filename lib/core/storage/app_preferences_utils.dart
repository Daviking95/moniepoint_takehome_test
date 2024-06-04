part of 'package:nova/core/storage/exports.dart';

class AppPreferencesUtils {
  static late SharedPreferences _sharedPrefs;

  factory AppPreferencesUtils() => AppPreferencesUtils._internal();

  AppPreferencesUtils._internal();

  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static Future<bool> readFromPref(String key) async {
    try {
      final value = _sharedPrefs.get(key);

      return value == null ? false : true;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> getFromPref(String key) async {
    try {
      final value =
          json.decode(await decryptString(_sharedPrefs.getString(key)!));

      return value;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> saveToPref(String key, var value) async {
    try {
      if (value == null) return false;

      'value.runtimeType $value'.log();

      _sharedPrefs.setString(key, await cryptString(json.encode(value)));

      return true;
    } catch (e) {
      'error $e'.log();

      return false;
    }
  }

  static Future<bool> clearPref() async {
    try {
      _sharedPrefs.clear();

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> removePref(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
      return true;
    } catch (e) {
      return false;
    }
  }
}
