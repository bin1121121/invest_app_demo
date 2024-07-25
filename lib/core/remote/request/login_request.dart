class LoginRequest {
  final String _userName;
  final String _password;
  LoginRequest({
    required String userName,
    required String password,
  })  : _userName = userName,
        _password = password;

  LoginRequest copyWith({
    String? userName,
    String? password,
  }) {
    return LoginRequest(
      userName: userName ?? _userName,
      password: password ?? _password,
    );
  }

  String get userName => _userName;
  String get password => _password;
}
