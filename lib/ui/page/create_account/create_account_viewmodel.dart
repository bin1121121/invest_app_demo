import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/helper/store/user_store.dart';

import 'package:rxdart/rxdart.dart';

class CreateAccountViewmodel extends ChangeNotifier {
  RegisterObj registerObj = RegisterObj("", "", "");
  bool _isPasswordVisible = true;
  final BehaviorSubject<bool> _isAllInputsValidStreamController =
      BehaviorSubject<bool>();

  void dispose() {
    _isAllInputsValidStreamController.close();
  }

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

  bool isUserNameValid(String userName) {
    return userName.length >= 6;
  }

  bool isEmailValid(String email) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+_/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    RegExp passwordRegExp = RegExp(r"^[A-Za-z0-9.!#$%&'*+_/=?^_{|}~]+");
    return passwordRegExp.hasMatch(password) && password.length > 6;
  }

  Future onRegister(BuildContext context) async {
    UserStore userStore = UserStore();
    userStore.onSaveInLocal(registerObj.userName);
    Navigator.pushReplacementNamed(context, RouteName.homePage);
  }

  Stream<bool> get isAllInputsValidStream =>
      _isAllInputsValidStreamController.stream;

  bool get isPasswordVisible => _isPasswordVisible;
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
