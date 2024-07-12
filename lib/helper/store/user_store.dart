import 'package:invest_app_flutter_test/core/resource/storage.dart';
import 'package:invest_app_flutter_test/main.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class UserStore {
  static final UserStore _instance = UserStore._internal();
  factory UserStore() => _instance;
  UserStore._internal() {}

  String? _userName = "";

  Future init() async {
    _userName = await rxSharedPreferences.getString(STORAGE_USER_NAME);
  }

  void onSaveInLocal(String userName) {
    _userName = userName;
    rxSharedPreferences.setString(STORAGE_USER_NAME, _userName);
  }

  void onLogout() {
    _userName = "";
    rxSharedPreferences.remove(STORAGE_USER_NAME);
  }

  String? get userName => _userName;
}
