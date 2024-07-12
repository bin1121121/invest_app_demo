import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_page.dart';
import 'package:invest_app_flutter_test/ui/page/home/home_page.dart';
import 'package:invest_app_flutter_test/ui/page/sign_up/sign_up_page.dart';
import 'package:invest_app_flutter_test/ui/page/splash/splash_page.dart';
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
    case RouteName.homePage:
      return MaterialPageRoute(
        builder: (_) => const HomePage(),
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
