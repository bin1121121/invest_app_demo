import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';
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
    // final AppShared appShared = Provider.of<AppShared>(context, listen: false);
    // final String email = _emailController.text;
    customToast(
      message: AppString.loginSuccess,
      backgroundColor: AppColors.green,
    );
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isPasswordVisible => _isPasswordVisible;
}
