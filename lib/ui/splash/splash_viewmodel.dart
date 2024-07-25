import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';

class SplashViewModel extends BaseViewModel {
  Future onNextPage() async {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        await AppShared().getAccessToken().then(
          (value) {
            if (value != null && value.isNotEmpty) {
              Navigator.pushReplacementNamed(
                  context, RouteName.applicationPage);
            } else {
              Navigator.pushReplacementNamed(context, RouteName.signUpPage);
            }
          },
        );
      },
    );
  }
}
