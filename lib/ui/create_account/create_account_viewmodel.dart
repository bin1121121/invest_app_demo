import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/type/gender_type.dart';
import 'package:invest_app_flutter_test/helper/routers.dart';
import 'package:invest_app_flutter_test/helper/validation.dart';
import 'package:invest_app_flutter_test/core/remote/request/register_request.dart';
import 'package:invest_app_flutter_test/core/remote/services/resource_type.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class CreateAccountViewModel extends BaseViewModel {
  CreateAccountViewModel({
    required this.authRepository,
  });
  final AuthRepository authRepository;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GenderType _genderValue = GenderType.male;
  RegisterRequest _registerRequest = RegisterRequest(
    firstName: "",
    lastName: "",
    email: "",
    gender: GenderType.male.name,
    password: "",
  );
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  final BehaviorSubject<bool> _isAllInputsValidStreamController =
      BehaviorSubject<bool>.seeded(false);

  void changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void changeConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void setFirstName(String value) {
    _registerRequest.firstName = value;
    _isAllInputsValidSink();
  }

  void setLastName(String value) {
    _registerRequest.lastName = value;
    _isAllInputsValidSink();
  }

  void setEmail(String value) {
    _registerRequest.email = value;
    _isAllInputsValidSink();
  }

  void setPassword(String value) {
    _registerRequest.password = value;
    _isAllInputsValidSink();
  }

  void setConfirmPassword(String value) {
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
    if (value != _registerRequest.password) {
      return AppLanguages.confirmPasswordError;
    }
    return null;
  }

  void _isAllInputsValidSink() {
    if (_registerRequest.firstName.isNotEmpty &&
        _registerRequest.email.isNotEmpty &&
        _registerRequest.password.isNotEmpty &&
        _registerRequest.lastName.isNotEmpty &&
        _registerRequest.gender.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      _isAllInputsValidStreamController.add(true);
    } else {
      _isAllInputsValidStreamController.add(false);
    }
  }

  void onChangeSelectedGender(GenderType value) {
    _genderValue = value;
    _registerRequest.gender = value.name;
    notifyListeners();
  }

  void onValidForm() {
    if (_formKey.currentState!.validate()) {
      onRegister();
    }
  }

  Future onRegister() async {
    RegisterRequest registerRequest = RegisterRequest(
      firstName: _registerRequest.firstName,
      lastName: _registerRequest.lastName,
      email: _registerRequest.email,
      gender: _registerRequest.gender,
      password: _registerRequest.password,
    );
    final response = await authRepository.registerUser(registerRequest);
    if (response.code == ResourceType.requestSuccess) {
      print(response.data.toString());
      customToast(
          message: AppLanguages.registerSuccess, backgroundColor: Colors.green);
      // Navigator.pushNamedAndRemoveUntil(context, RouteName.applicationPage, predicate)
    } else {
      customToast(message: response.message, backgroundColor: Colors.red);
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
    _isAllInputsValidStreamController.close();
    super.dispose();
  }

  Stream<bool> get isAllInputsValidStream =>
      _isAllInputsValidStreamController.stream;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  GenderType get genderValue => _genderValue;

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  GlobalKey<FormState> get formKey => _formKey;
}
