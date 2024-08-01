import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/type/gender_type.dart';
import 'package:invest_app_flutter_test/helper/routers.dart';
import 'package:invest_app_flutter_test/core/remote/request/register_request.dart';
import 'package:invest_app_flutter_test/core/resource_type.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class CreateAccountViewModel extends BaseViewModel {
  CreateAccountViewModel({required this.authRepository});
  final AuthRepository authRepository;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GenderType _genderValue = GenderType.male;
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  final BehaviorSubject<bool> _enableCreateButtonSubject =
      BehaviorSubject<bool>.seeded(false);

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void changeConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void isAllInputsValidSink() {
    if (_firstNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      _enableCreateButtonSubject.add(true);
    } else {
      _enableCreateButtonSubject.add(false);
    }
  }

  void onChangeSelectedGender(GenderType? value) {
    _genderValue = value ?? GenderType.male;
    notifyListeners();
  }

  void onValidForm() {
    if (_formKey.currentState!.validate()) {
      onRegister();
    }
  }

  Future onRegister() async {
    RegisterRequest registerRequest = RegisterRequest(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      gender: _genderValue.name,
      password: _passwordController.text,
    );
    final response = await authRepository.registerUser(registerRequest);
    if (response.code == ResourceType.requestSuccess) {
      print(response.data.toString());
      CustomToast().toast(
          message: AppLanguages.registerSuccess, backgroundColor: Colors.green);
      // Navigator.pushNamedAndRemoveUntil(context, RouteName.applicationPage, predicate)
    } else {
      CustomToast()
          .toast(message: response.message, backgroundColor: Colors.red);
    }
  }

  void onNavigateToLogin() {
    Navigator.of(context).pushNamed(Routers.login);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _enableCreateButtonSubject.close();
    super.dispose();
  }

  BehaviorSubject<bool> get enableCreateButtonSubject =>
      _enableCreateButtonSubject;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  GenderType? get genderValue => _genderValue;

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  GlobalKey<FormState> get formKey => _formKey;
}
