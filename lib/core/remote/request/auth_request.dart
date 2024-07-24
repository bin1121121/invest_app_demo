// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterRequest {
  String firstName;
  String lastName;
  String gender;
  String email;
  String password;
  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.password,
  });
}

class LoginRequest {
  String email;
  String password;
  LoginRequest({
    required this.email,
    required this.password,
  });
}
