import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/routers.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class AppFunction {
  void logOut(BuildContext context) {
    AppShared().logOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routers.signUp,
      (route) => false,
    );
  }
}
