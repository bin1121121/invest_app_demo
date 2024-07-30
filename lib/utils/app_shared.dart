import 'dart:async';
import 'dart:convert';

import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AppShared {
  static final RxSharedPreferences _rxPreferences = RxSharedPreferences(
    SharedPreferences.getInstance(),
  );

  Future setUserProfile(UserProfile userProfile) async {
    final json = jsonEncode(userProfile.toJson());
    await _rxPreferences.setString(AppConstants.storageUserProfile, json);
  }

  Future<UserProfile?> getUserProfile() async {
    String? json =
        await _rxPreferences.getString(AppConstants.storageUserProfile);
    return UserProfile.fromJson(jsonDecode(json ?? ""));
  }

  Stream<UserProfile?> watchUserProfile() {
    return _rxPreferences
        .getStringStream(AppConstants.storageUserProfile)
        .map((json) => UserProfile.fromJson(jsonDecode(json ?? "")))
        .asBroadcastStream();
  }

  Future setAccessToken(String value) async {
    await _rxPreferences.setString(AppConstants.storageAccessToken, value);
  }

  Future setRefreshToken(String value) async {
    await _rxPreferences.setString(AppConstants.storageRefreshToken, value);
  }

  Future<String?> getAccessToken() async {
    return await _rxPreferences.getString(AppConstants.storageAccessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _rxPreferences.getString(AppConstants.storageRefreshToken);
  }

  Future<void> _removeKey(String key) async {
    await _rxPreferences.remove(key);
  }

  Future<void> logOut() async {
    await _removeKey(AppConstants.storageUserProfile);
    await _removeKey(AppConstants.storageAccessToken);
    await _removeKey(AppConstants.storageRefreshToken);
  }

  Future<void> clear() async {
    await _rxPreferences.clear();
  }

  RxSharedPreferences get rxSharedPreferences => _rxPreferences;
}
