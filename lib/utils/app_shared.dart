import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AppShared {
  // static final AppShared _instance = AppShared._internal();
  // AppShared._internal();
  // factory AppShared() => _instance;

  late SharedPreferences _preferences;
  late RxSharedPreferences _rxPreferences;

  Future getSharedPreference() async {
    _preferences = await SharedPreferences.getInstance();
    _rxPreferences = await RxSharedPreferences(_preferences);
  }

  Future<void> setString(String key, String value) async {
    await _rxPreferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return await _rxPreferences.getString(key);
  }

  Future<void> remove(String key) async {
    await _rxPreferences.remove(key);
  }

  RxSharedPreferences get rxSharedPreferences => _rxPreferences;
}
