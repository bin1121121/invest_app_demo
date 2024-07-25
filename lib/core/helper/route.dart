import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/route_func.dart';
import 'package:invest_app_flutter_test/ui/application/application_page.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_page.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_page.dart';
import 'package:invest_app_flutter_test/ui/login/login_page.dart';
import 'package:invest_app_flutter_test/ui/notification/notification_page.dart';
import 'package:invest_app_flutter_test/ui/sign_up/sign_up_page.dart';
import 'package:invest_app_flutter_test/ui/splash/splash_page.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splashPage:
      return animRoute(SplashPage());
    case RouteName.signUpPage:
      return animRoute(SignUpPage());
    case RouteName.createAccountPage:
      return animRoute(CreateAccountPage());
    case RouteName.applicationPage:
      return animRoute(ApplicationPage());
    case RouteName.loginPage:
      return animRoute(LoginPage());
    case RouteName.contactInfoPage:
      return animRoute(ContactInfoPage());
    case RouteName.notificationPage:
      return animRoute(NotificationPage());
    default:
      return animRoute(
        Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
