import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/remote/request/auth_request.dart';
import 'package:invest_app_flutter_test/core/remote/services/auth_services.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_show_loading.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends BaseViewModel {
  late final AuthRepository _authRepository;
  late final AuthServices authServices;
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool _isPasswordVisible = true;

  void onInit() {
    _authRepository = Provider.of<AuthRepository>(context, listen: false);
    authServices = Provider.of<AuthServices>(context, listen: false);
  }

  Future onLogin() async {
    customShowLoading(context);
    final LoginRequest loginRequest = LoginRequest(
        email: _userNameTextEditingController.text,
        password: _passwordTextEditingController.text);
    final response = await _authRepository.login(loginRequest);
    if (response.code == ResourceType.REQUEST_SUCCESS) {
      customToast(
          message: AppLanguages.loginSuccess, backgroundColor: AppColors.green);
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.applicationPage, (route) => false);
    } else {
      Navigator.pop(context);
      customToast(message: response.message, backgroundColor: AppColors.red);
    }
  }

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  TextEditingController get userNameTextEditingController =>
      _userNameTextEditingController;
  TextEditingController get passwordTextEditingController =>
      _passwordTextEditingController;
  bool get isPasswordVisible => _isPasswordVisible;
}
