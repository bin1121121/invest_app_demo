import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
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
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
