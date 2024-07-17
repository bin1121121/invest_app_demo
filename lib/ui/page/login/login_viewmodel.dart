import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:invest_app_flutter_test/core/remote/services/app_services.dart';
import 'package:invest_app_flutter_test/core/remote/services/error_handle.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future onSignIn() async {
    AppServices appServices = Provider.of<AppServices>(context, listen: false);
    try {
      await appServices
          .login(
        _emailController.text,
        _passwordController.text,
      )
          .then((authenticationResponse) async {
        AppShared appShared = Provider.of<AppShared>(context, listen: false);
        await appShared.setString(
            STORAGE_EMAIL, authenticationResponse.email ?? "");
        await appShared.setString(
            STORAGE_AVATAR, authenticationResponse.image ?? "");
        await appShared.setString(STORAGE_USER_NAME,
            "${authenticationResponse.firstName} ${authenticationResponse.lastName}");
        await appShared.setString(
            STORAGE_GENDER, authenticationResponse.gender ?? "");
        customToast(
          message: AppString.loginSuccess,
          backgroundColor: AppColors.green,
        );
        Navigator.of(context).pushReplacementNamed(RouteName.applicationPage);
      });
    } catch (e) {
      if (e is DioException) {
        customToast(
          message: ErrorHandler.dioException(error: e).getErrorMessage(),
          backgroundColor: AppColors.red,
        );
      }
    }
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isPasswordVisible => _isPasswordVisible;
}
