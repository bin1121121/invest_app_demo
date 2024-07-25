import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/routers.dart';
import 'package:invest_app_flutter_test/core/helper/validation.dart';
import 'package:invest_app_flutter_test/core/remote/request/login_request.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_show_loading.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({
    required this.authRepository,
  });
  final AuthRepository authRepository;
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool _isPasswordVisible = true;
  final BehaviorSubject<bool> _isAllValidInput =
      BehaviorSubject<bool>.seeded(false);

  LoginRequest _loginObj = LoginRequest(
    userName: "",
    password: "",
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future onLogin() async {
    customShowLoading(context);
    final LoginRequest loginRequest = LoginRequest(
      userName: _userNameTextEditingController.text,
      password: _passwordTextEditingController.text,
    );
    final response = await authRepository.login(loginRequest);
    if (response.code == ResourceType.REQUEST_SUCCESS) {
      customToast(
          message: AppLanguages.loginSuccess, backgroundColor: AppColors.green);
      Navigator.pushNamedAndRemoveUntil(
          context, Routers.application, (route) => false);
    } else {
      Navigator.pop(context);
      customToast(message: response.message, backgroundColor: AppColors.red);
    }
  }

  void setUserName(String value) {
    _loginObj = _loginObj.copyWith(userName: value);
    _isAllValidInputSink();
  }

  void setPassword(String value) {
    _loginObj = _loginObj.copyWith(password: value);
    _isAllValidInputSink();
  }

  void _isAllValidInputSink() {
    if (_loginObj.userName.isNotEmpty && _loginObj.password.isNotEmpty) {
      _isAllValidInput.add(true);
    } else {
      _isAllValidInput.add(false);
    }
  }

  String? validUserName(String? value) {
    if (!ValidationHelper().isUserNameValid(value ?? "")) {
      return AppLanguages.userNameError;
    }
    return null;
  }

  String? validPassword(String? value) {
    if (!ValidationHelper().isPasswordValid(value ?? "")) {
      return AppLanguages.passwordError;
    }
    return null;
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
