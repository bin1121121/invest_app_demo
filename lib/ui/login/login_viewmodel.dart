import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/helper/routers.dart';
import 'package:invest_app_flutter_test/core/remote/request/login_request.dart';
import 'package:invest_app_flutter_test/core/resource_type.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_show_loading.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({required this.authRepository});
  final AuthRepository authRepository;
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool _isPasswordVisible = true;
  final BehaviorSubject<bool> _enableLoginButtonSubject =
      BehaviorSubject<bool>.seeded(false);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future onLogin() async {
    customShowLoading(context);
    LoginRequest loginRequest = LoginRequest(
        username: _userNameTextEditingController.text,
        password: _passwordTextEditingController.text,
        expiresInMins: 1);
    final response = await authRepository.login(loginRequest);
    if (response.code == ResourceType.requestSuccess) {
      CustomToast().toast(
          message: AppLanguages.loginSuccess, backgroundColor: AppColors.green);
      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routers.application,
        (route) => false,
      );
    } else {
      if (context.mounted) {
        Navigator.pop(context);
        CustomToast()
            .toast(message: response.message, backgroundColor: AppColors.red);
      }
    }
  }

  void isAllInputValidSink() {
    if (_userNameTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      _enableLoginButtonSubject.add(true);
    } else {
      _enableLoginButtonSubject.add(false);
    }
  }

  void onValidForm() {
    if (_formKey.currentState!.validate()) {
      onLogin();
    }
  }

  void onNavigateToCreateAccount() {
    Navigator.of(context).pushNamed(Routers.createAccount);
  }

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  @override
  void dispose() {
    _userNameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _enableLoginButtonSubject.close();
    super.dispose();
  }

  TextEditingController get userNameTextEditingController =>
      _userNameTextEditingController;
  TextEditingController get passwordTextEditingController =>
      _passwordTextEditingController;
  bool get isPasswordVisible => _isPasswordVisible;
  BehaviorSubject<bool> get enableLoginButtonSubject =>
      _enableLoginButtonSubject;
  GlobalKey<FormState> get formKey => _formKey;
}
