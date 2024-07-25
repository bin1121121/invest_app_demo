import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';

class SignUpViewModel extends BaseViewModel {
  void onNavigateToCreateAccount() {
    Navigator.pushNamed(context, RouteName.createAccountPage);
  }

  void onNavigateToLogin() {
    Navigator.pushNamed(context, RouteName.loginPage);
  }
}
