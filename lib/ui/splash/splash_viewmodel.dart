import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/routers.dart';
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
              Navigator.pushReplacementNamed(context, Routers.application);
            } else {
              Navigator.pushReplacementNamed(context, Routers.signUp);
            }
          },
        );
      },
    );
  }
}
