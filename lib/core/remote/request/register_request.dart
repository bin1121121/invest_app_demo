class RegisterRequest {
  final String _firstName;
  final String _lastName;
  final String _gender;
  final String _email;
  final String _password;
  final String _confirmPassword;
  RegisterRequest({
    required String firstName,
    required String lastName,
    required String gender,
    required String email,
    required String password,
    required String confirmPassword,
  })  : _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _gender = gender,
        _password = password,
        _confirmPassword = confirmPassword;

  RegisterRequest copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? gender,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterRequest(
      firstName: firstName ?? _firstName,
      lastName: lastName ?? _lastName,
      email: email ?? _email,
      gender: gender ?? _gender,
      password: password ?? _password,
      confirmPassword: confirmPassword ?? _confirmPassword,
    );
  }

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get gender => _gender;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
}
