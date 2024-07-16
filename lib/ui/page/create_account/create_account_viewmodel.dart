import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/page/utils/valid_input.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';
import 'package:provider/provider.dart';

import 'package:rxdart/rxdart.dart';

class CreateAccountViewModel extends BaseViewModel {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegisterObj registerObj = RegisterObj("", "", "");
  bool _isPasswordVisible = true;
  final BehaviorSubject<bool> _isAllInputsValidStreamController =
      BehaviorSubject<bool>();

  // void dispose() {
  //   _isAllInputsValidStreamController.close();
  // }

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setUserName(String value) {
    registerObj = registerObj.copyWith(userName: value);
    _isAllInputsValidSink();
  }

  void setEmail(String value) {
    registerObj = registerObj.copyWith(email: value);
    _isAllInputsValidSink();
  }

  void setPassword(String value) {
    registerObj = registerObj.copyWith(password: value);
    _isAllInputsValidSink();
  }

  void _isAllInputsValidSink() {
    if (registerObj.userName.isNotEmpty &&
        registerObj.email.isNotEmpty &&
        registerObj.password.isNotEmpty) {
      _isAllInputsValidStreamController.add(true);
    } else {
      _isAllInputsValidStreamController.add(false);
    }
  }

  String? validEmail(String? value) {
    if (!isEmailValid(value ?? "")) {
      return AppString.emailError;
    }
    return null;
  }

  String? validFullName(String? value) {
    if (!isUserNameValid(value ?? "")) {
      return AppString.userNameError;
    }
    return null;
  }

  String? validPassword(String? value) {
    if (!isPasswordValid(value ?? "")) {
      return AppString.passwordError;
    }
    return null;
  }

  Future onRegister(BuildContext context) async {
    final AppShared appShared = Provider.of<AppShared>(context, listen: false);
    await appShared.setString(STORAGE_USER_NAME, registerObj.userName);
    await appShared.setString(STORAGE_EMAIL, registerObj.email);
    Navigator.pushReplacementNamed(context, RouteName.applicationPage);
    customToast(
      message: AppString.createAccount,
      backgroundColor: AppColors.green,
    );
  }

  Stream<bool> get isAllInputsValidStream =>
      _isAllInputsValidStreamController.stream;

  bool get isPasswordVisible => _isPasswordVisible;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
}

class RegisterObj {
  String userName;
  String email;
  String password;
  RegisterObj(this.userName, this.email, this.password);

  RegisterObj copyWith({
    String? userName,
    String? email,
    String? password,
  }) {
    return RegisterObj(
      userName ?? this.userName,
      email ?? this.email,
      password ?? this.password,
    );
  }
}
