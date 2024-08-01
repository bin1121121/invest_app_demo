import 'package:invest_app_flutter_test/utils/app_languages.dart';

class ValidationHelper {
  bool _isUserNameValid(String userName) {
    return userName.length >= 2;
  }

  String? isFirstNameValidMessage(String? value) {
    if (!_isUserNameValid(value ?? "")) {
      return AppLanguages.firstNameError;
    }
    return null;
  }

  String? isLastNameValidMessage(String? value) {
    if (!_isUserNameValid(value ?? "")) {
      return AppLanguages.lastNameError;
    }
    return null;
  }

  String? isUserNameValidMessage(String? value) {
    if (!_isUserNameValid(value ?? "")) {
      return AppLanguages.userNameError;
    }
    return null;
  }

  String? isEmailValidMessage(String? email) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+_/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(email ?? "")) {
      return AppLanguages.emailError;
    }
    return null;
  }

  String? isPasswordValidMessage(String? password) {
    RegExp passwordRegExp = RegExp(r"^[A-Za-z0-9.!#$%&'*+_/=?^_{|}~]+");
    if (!(passwordRegExp.hasMatch(password ?? "") && password!.length >= 6)) {
      return AppLanguages.passwordError;
    }
    return null;
  }

  String? isConfirmPasswordValidMessage(
      String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return AppLanguages.confirmPasswordError;
    }
    return null;
  }

  String? isBirthDateValidMessage(String? birthDate) {
    if (birthDate == null || birthDate.isEmpty) {
      return AppLanguages.birthDateError;
    }
    return null;
  }

  String? isGenderValidMessage(String? gender) {
    if (gender == null || gender.isEmpty) {
      return AppLanguages.genderError;
    }
    return null;
  }

  String? isPhoneNumberValid(String? phoneNumber) {
    RegExp phoneNumberRegExp = RegExp(r"^[0-9]{10}$");
    if (!phoneNumberRegExp.hasMatch(phoneNumber ?? "")) {
      return AppLanguages.phoneNumberError;
    }
    return null;
  }
}
