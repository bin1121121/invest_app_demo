import 'dart:async';

import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AppShared {
  // static final AppShared _instance = AppShared._internal();
  // AppShared._internal();
  // factory AppShared() => _instance;

  static late SharedPreferences _preferences;
  static late RxSharedPreferences _rxPreferences;

  Future<AppShared> getSharedPreference() async {
    _preferences = await SharedPreferences.getInstance();
    _rxPreferences = await RxSharedPreferences(_preferences);
    return this;
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

  Stream<String?> watchAvatar() {
    return _rxPreferences
        .getStringStream(AppConstants.STORAGE_AVATAR)
        .asBroadcastStream();
  }

  Stream<String?> watchName() {
    return _rxPreferences
        .getStringStream(AppConstants.STORAGE_USER_NAME)
        .asBroadcastStream();
  }

  Future setUserName(String value) async {
    await _rxPreferences.setString(AppConstants.STORAGE_USER_NAME, value);
  }

  Future setEmail(String value) async {
    await _rxPreferences.setString(AppConstants.STORAGE_EMAIL, value);
  }

  Future setAvatar(String value) async {
    await _rxPreferences.setString(AppConstants.STORAGE_AVATAR, value);
  }

  Future setGender(String value) async {
    await _rxPreferences.setString(AppConstants.STORAGE_GENDER, value);
  }

  Future setAccessToken(String value) async {
    await _rxPreferences.setString(AppConstants.STORAGE_ACCESS_TOKEN, value);
  }

  Future setRefreshToken(String value) async {
    await _rxPreferences.setString(AppConstants.STORAGE_REFRESH_TOKEN, value);
  }

  Future<String?> getAccessToken() async {
    return await _rxPreferences.getString(AppConstants.STORAGE_ACCESS_TOKEN);
  }

  Future<String?> getRefreshToken() async {
    return await _rxPreferences.getString(AppConstants.STORAGE_REFRESH_TOKEN);
  }

  RxSharedPreferences get rxSharedPreferences => _rxPreferences;
}
