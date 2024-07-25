import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class AppFunction {
  void logOut(BuildContext context) {
    AppShared().logOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteName.signUpPage,
      (route) => false,
    );
  }
}
