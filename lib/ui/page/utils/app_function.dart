import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';

class AppFunction {
  void logOut(BuildContext context) {
    AppShared _appShared = Provider.of<AppShared>(context, listen: false);
    print("Log out");
    _appShared.rxSharedPreferences.clear();
    Navigator.of(context).pushReplacementNamed(RouteName.signUpPage);
  }
}
