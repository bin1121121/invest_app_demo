import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AccountViewModel extends BaseViewModel {
  late final AppShared _appShared;
  late final Stream<String?> _userStream;
  late final Stream<String?> _avatarStream;

  void onInit() {
    _appShared = Provider.of<AppShared>(context, listen: false);
    _userStream = _appShared.rxSharedPreferences
        .getStringStream(STORAGE_USER_NAME)
        .asBroadcastStream();
    _avatarStream = _appShared.watchAvatar();
  }

  void logOut() {
    _appShared.rxSharedPreferences.clear();
    Navigator.of(context).pushReplacementNamed(RouteName.signUpPage);
  }

  Stream<String?> get avatarStream => _avatarStream;
  Stream<String?> get userStream => _userStream;
}
