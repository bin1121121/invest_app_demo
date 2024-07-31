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
  final BehaviorSubject<bool> _isAllValidInput =
      BehaviorSubject<bool>.seeded(false);

  final LoginRequest _loginObj = LoginRequest(
    username: "",
    password: "",
    expiresInMins: 1,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future onLogin() async {
    customShowLoading(context);
    final response = await authRepository.login(_loginObj);
    if (response.code == ResourceType.requestSuccess) {
      customToast(
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
        customToast(message: response.message, backgroundColor: AppColors.red);
        print(response.message);
      }
    }
  }

  void setUserName(String value) {
    _loginObj.username = value;
    _isAllValidInputSink();
  }

  void setPassword(String value) {
    _loginObj.password = value;
    _isAllValidInputSink();
  }

  void _isAllValidInputSink() {
    if (_loginObj.username.isNotEmpty && _loginObj.password.isNotEmpty) {
      _isAllValidInput.add(true);
    } else {
      _isAllValidInput.add(false);
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
    _isAllValidInput.close();
    super.dispose();
  }

  TextEditingController get userNameTextEditingController =>
      _userNameTextEditingController;
  TextEditingController get passwordTextEditingController =>
      _passwordTextEditingController;
  bool get isPasswordVisible => _isPasswordVisible;
  Stream<bool> get isAllValidInput => _isAllValidInput.stream;
  GlobalKey<FormState> get formKey => _formKey;
}
