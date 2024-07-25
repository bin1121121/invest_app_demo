import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/application/application_page.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_page.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_page.dart';
import 'package:invest_app_flutter_test/ui/login/login_page.dart';
import 'package:invest_app_flutter_test/ui/notification/notification_page.dart';
import 'package:invest_app_flutter_test/ui/sign_up/sign_up_page.dart';
import 'package:invest_app_flutter_test/ui/splash/splash_page.dart';

class Routers {
  static const splash = '/';
  static const signUp = '/sign_up';
  static const createAccount = '/create_account';
  static const login = '/login';
  static const application = '/application';
  static const contactInfo = '/contact_info';
  static const notification = '/notification';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    switch (routeName) {
      case splash:
        return animRoute(const SplashPage());
      case signUp:
        return animRoute(const SignUpPage());
      case createAccount:
        return animRoute(const CreateAccountPage());
      case login:
        return animRoute(const LoginPage());
      case application:
        return animRoute(const ApplicationPage());
      case contactInfo:
        return animRoute(const ContactInfoPage());
      case notification:
        return animRoute(const NotificationPage());
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

  static Route animRoute(Widget page, {Offset? beginOffset}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginOffset ?? const Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
