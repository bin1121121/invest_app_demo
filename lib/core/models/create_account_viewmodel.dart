// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invest_app_flutter_test/core/helper/validation.dart';
import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/core/remote/request/auth_request.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class CreateAccountViewModel extends BaseViewModel {
  late final AuthRepository _authRepository;
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
      BehaviorSubject<bool>.seeded(false);

  // void dispose() {
  //   _isAllInputsValidStreamController.close();
  // }

  void onInit() {
    _authRepository = Provider.of<AuthRepository>(context, listen: false);
  }

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
    if (!ValidationHelper().isEmailValid(value ?? "")) {
      return AppLanguages.emailError;
    }
    return null;
  }

  String? validFirstName(String? value) {
    if (!ValidationHelper().isUserNameValid(value ?? "")) {
      return AppLanguages.firstNameError;
    }
    return null;
  }

  String? validLastName(String? value) {
    if (!ValidationHelper().isUserNameValid(value ?? "")) {
      return AppLanguages.lastNameError;
    }
    return null;
  }

  String? validPassword(String? value) {
    if (!ValidationHelper().isPasswordValid(value ?? "")) {
      return AppLanguages.passwordError;
    }
    return null;
  }

  String? validConfirmPassword(String? value) {
    if (value != _registerObj.password) {
      return AppLanguages.confirmPasswordError;
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

  void onValidForm() {
    if (_formKey.currentState!.validate()) {
      onRegister();
    }
  }

  void onNavigateToLogin() {
    Navigator.of(context).pushNamed(RouteName.loginPage);
  }

  Future onRegister() async {
    final RegisterRequest registerRequest = RegisterRequest(
      firstName: _registerObj.firstName,
      lastName: _registerObj.lastName,
      email: _registerObj.email,
      gender: _registerObj.gender,
      password: _registerObj.password,
    );
    final response = await _authRepository.registerUser(registerRequest);
    if (response.code == ResourceType.REQUEST_SUCCESS) {
      customToast(
          message: AppLanguages.registerSuccess, backgroundColor: Colors.green);
      // Navigator.pushNamedAndRemoveUntil(context, RouteName.applicationPage, predicate)
    } else {
      customToast(message: response.message, backgroundColor: Colors.red);
    }
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
