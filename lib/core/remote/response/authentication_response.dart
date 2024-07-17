// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? image;
  AuthenticationResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.image,
  });
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

  @override
  String toString() {
    return "id: $id, firstName: $firstName, lastName: $lastName, email: $email, gender: $gender";
  }
}
