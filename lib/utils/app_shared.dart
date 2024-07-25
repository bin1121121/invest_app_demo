import 'dart:async';
import 'dart:convert';

import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AppShared {
  static final RxSharedPreferences _rxPreferences =
      RxSharedPreferences(SharedPreferences.getInstance());

  Future setUserProfile(UserProfile userProfile) async {
    final json = jsonEncode(userProfile.toJson());
    await _rxPreferences.setString(AppConstants.STORAGE_USER_PROFILE, json);
  }

  Future<UserProfile?> getUserProfile() async {
    String? json =
        await _rxPreferences.getString(AppConstants.STORAGE_USER_PROFILE);
    return UserProfile.fromJson(jsonDecode(json ?? ""));
  }

  Stream<UserProfile?> watchUserProfile() {
    return _rxPreferences
        .getStringStream(AppConstants.STORAGE_USER_PROFILE)
        .map((json) => UserProfile.fromJson(jsonDecode(json ?? "")))
        .asBroadcastStream();
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

  Future<void> _removeKey(String key) async {
    await _rxPreferences.remove(key);
  }

  Future<void> logOut() async {
    await _removeKey(AppConstants.STORAGE_USER_PROFILE);
    await _removeKey(AppConstants.STORAGE_ACCESS_TOKEN);
    await _removeKey(AppConstants.STORAGE_REFRESH_TOKEN);
    await _removeKey(AppConstants.STORAGE_EXPIRED_TIME);
  }

  Future<void> clear() async {
    await _rxPreferences.clear();
  }

  RxSharedPreferences get rxSharedPreferences => _rxPreferences;
}
