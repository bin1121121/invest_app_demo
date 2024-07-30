import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/helper/routers.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';

class SignUpViewModel extends BaseViewModel {
  void onNavigateToCreateAccount() {
    Navigator.pushNamed(context, Routers.createAccount);
  }

  void onNavigateToLogin() {
    Navigator.pushNamed(context, Routers.login);
  }
}
