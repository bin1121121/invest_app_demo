import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/application/application_page.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_page.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_page.dart';
import 'package:invest_app_flutter_test/ui/login/login_page.dart';
import 'package:invest_app_flutter_test/ui/notification/notification_page.dart';
import 'package:invest_app_flutter_test/ui/sign_up/sign_up_page.dart';
import 'package:invest_app_flutter_test/ui/splash/splash_page.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splashPage:
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
      );
    case RouteName.signUpPage:
      return MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      );
    case RouteName.createAccountPage:
      return MaterialPageRoute(
        builder: (_) => const CreateAccountPage(),
      );
    case RouteName.applicationPage:
      return MaterialPageRoute(
        builder: (_) => const ApplicationPage(),
      );
    case RouteName.loginPage:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
      );
    case RouteName.contactInfoPage:
      return MaterialPageRoute(
        builder: (_) => const ContactInfoPage(),
      );
    case RouteName.notificationPage:
      return MaterialPageRoute(
        builder: (_) => const NotificationPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
