import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/helper/validation.dart';
import 'package:invest_app_flutter_test/core/remote/request/auth_request.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_show_loading.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel {
  late final AuthRepository _authRepository;
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool _isPasswordVisible = true;
  final BehaviorSubject<bool> _isAllValidInput =
      BehaviorSubject<bool>.seeded(false);

  LoginObj _loginObj = LoginObj(userName: "", password: "");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onInit() {
    _authRepository = Provider.of<AuthRepository>(context, listen: false);
  }

  Future onLogin() async {
    customShowLoading(context);
    final LoginRequest loginRequest = LoginRequest(
      email: _userNameTextEditingController.text,
      password: _passwordTextEditingController.text,
    );
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
    Navigator.of(context).pushNamed(RouteName.createAccountPage);
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
  Stream<bool> get isAllValidInput => _isAllValidInput.stream;
  GlobalKey<FormState> get formKey => _formKey;
}

class LoginObj {
  final String userName;
  final String password;

  LoginObj({
    required this.userName,
    required this.password,
  });

  LoginObj copyWith({
    String? userName,
    String? password,
  }) {
    return LoginObj(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}
