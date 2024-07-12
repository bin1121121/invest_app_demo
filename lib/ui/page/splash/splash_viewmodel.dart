import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/helper/store/user_store.dart';

class SplashViewmodel {
  Future onNextPage(BuildContext context) async {
    UserStore _userStore = UserStore();
    await _userStore.init();
    if (_userStore.userName != null && _userStore.userName!.isNotEmpty) {
      Navigator.pushReplacementNamed(context, RouteName.homePage);
    } else {
      Navigator.pushReplacementNamed(context, RouteName.signUpPage);
    }
  }
}
