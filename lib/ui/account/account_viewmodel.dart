import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/utils/app_function.dart';

class AccountViewModel extends BaseViewModel {
  final AuthRepository authRepository;
  AccountViewModel({
    required this.authRepository,
  });

  void onLogOut() {
    AppFunction().logOut(context);
  }

  void onNavigateToContactInfoPage() {
    Navigator.of(context).pushNamed(RouteName.contactInfoPage);
  }
}
