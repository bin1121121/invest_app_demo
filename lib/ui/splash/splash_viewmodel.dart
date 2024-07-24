import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';

class SplashViewModel extends BaseViewModel {
  Future onNextPage() async {
    Future.delayed(
      Duration(seconds: 3),
      () async {
        final appShared = Provider.of<AppShared>(context, listen: false);
        await appShared.getSharedPreference().then((_) async {
          await appShared.getString(AppConstants.STORAGE_USER_NAME).then(
            (value) {
              print(value);
              if (value != null && value.isNotEmpty) {
                Navigator.pushReplacementNamed(
                    context, RouteName.applicationPage);
              } else {
                Navigator.pushReplacementNamed(context, RouteName.signUpPage);
              }
            },
          );
        });
      },
    );
  }
}
