// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/core/remote/services/app_services.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/page/utils/valid_input.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';

class CreateAccountViewModel extends BaseViewModel {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Gender _genderValue = Gender.Male;
  RegisterObj _registerObj = RegisterObj(
    firstName: "",
    lastName: "",
    email: "",
    gender: Gender.Male.name,
    password: "",
    confirmPassword: "",
  );
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  final BehaviorSubject<bool> _isAllInputsValidStreamController =
      BehaviorSubject<bool>();

  // void dispose() {
  //   _isAllInputsValidStreamController.close();
  // }

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void changeConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void setFirstName(String value) {
    _registerObj = _registerObj.copyWith(firstName: value);
    _isAllInputsValidSink();
  }

  void setLastName(String value) {
    _registerObj = _registerObj.copyWith(lastName: value);
    _isAllInputsValidSink();
  }

  void setEmail(String value) {
    _registerObj = _registerObj.copyWith(email: value);
    _isAllInputsValidSink();
  }

  void setPassword(String value) {
    _registerObj = _registerObj.copyWith(password: value);
    _isAllInputsValidSink();
  }

  void setConfirmPassword(String value) {
    _registerObj = _registerObj.copyWith(confirmPassword: value);
    _isAllInputsValidSink();
  }

  String? validEmail(String? value) {
    if (!isEmailValid(value ?? "")) {
      return AppString.emailError;
    }
    return null;
  }

  String? validFirstName(String? value) {
    if (!isUserNameValid(value ?? "")) {
      return AppString.firstNameError;
    }
    return null;
  }

  String? validLastName(String? value) {
    if (!isUserNameValid(value ?? "")) {
      return AppString.lastNameError;
    }
    return null;
  }

  String? validPassword(String? value) {
    if (!isPasswordValid(value ?? "")) {
      return AppString.passwordError;
    }
    return null;
  }

  String? validConfirmPassword(String? value) {
    if (value != _registerObj.password) {
      return AppString.confirmPasswordError;
    }
    return null;
  }

  void _isAllInputsValidSink() {
    if (_registerObj.firstName.isNotEmpty &&
        _registerObj.email.isNotEmpty &&
        _registerObj.password.isNotEmpty &&
        _registerObj.lastName.isNotEmpty &&
        _registerObj.gender.isNotEmpty &&
        _registerObj.confirmPassword.isNotEmpty) {
      _isAllInputsValidStreamController.add(true);
    } else {
      _isAllInputsValidStreamController.add(false);
    }
  }

  void onChangeSelectedGender(Gender value) {
    _genderValue = value;
    _registerObj = _registerObj.copyWith(gender: value.name);
    notifyListeners();
  }

  Future onRegister() async {
    AppServices appServices = Provider.of<AppServices>(context, listen: false);
    await appServices
        .registerUser(
      _registerObj.firstName,
      _registerObj.lastName,
      _registerObj.gender,
      _registerObj.email,
      _registerObj.password,
    )
        .then(
      (value) async {
        print("Id: ${value.toString()}");
        final AppShared appShared =
            Provider.of<AppShared>(context, listen: false);
        await appShared.setString(STORAGE_USER_NAME,
            "${_registerObj.firstName}  ${_registerObj.lastName}");
        await appShared.setString(STORAGE_EMAIL, _registerObj.email);
        await appShared.setString(STORAGE_GENDER, _registerObj.gender);
        Navigator.pushReplacementNamed(context, RouteName.applicationPage);
        customToast(
          message: AppString.createAccount,
          backgroundColor: AppColors.green,
        );
      },
    ).catchError((error) {
      print("Error: ${error}");
    });
  }

  Stream<bool> get isAllInputsValidStream =>
      _isAllInputsValidStreamController.stream;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  Gender get genderValue => _genderValue;

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  GlobalKey<FormState> get formKey => _formKey;
}

class RegisterObj {
  String firstName;
  String lastName;
  String email;
  String gender;
  String password;
  String confirmPassword;
  RegisterObj({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.password,
    required this.confirmPassword,
  });

  RegisterObj copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterObj(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  String toString() {
    return "RegisterObj(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword)";
  }
}
