class ValidationHelper {
  bool isUserNameValid(String userName) {
    return userName.length >= 2;
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

  bool isPhoneNumberValid(String phoneNumber) {
    RegExp phoneNumberRegExp = RegExp(r"^[0-9]{10}$");
    return phoneNumberRegExp.hasMatch(phoneNumber);
  }
}
