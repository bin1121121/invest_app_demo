import 'package:equatable/equatable.dart';

enum Gender { male, female }

class UserProfile extends Equatable {
  final String _avatar;
  final String _name;
  final String _email;
  final String _birthDate;
  final String _gender;
  final String _phoneNumber;
  const UserProfile({
    String? avatar,
    String? name,
    String? email,
    String? gender,
    String? birthDate,
    String? phoneNumber,
  })  : _avatar = avatar ?? "",
        _name = name ?? "",
        _email = email ?? "",
        _birthDate = birthDate ?? "",
        _phoneNumber = phoneNumber ?? "",
        _gender = gender ?? "";

  UserProfile copyWith({
    String? avatar,
    String? name,
    String? email,
    String? gender,
    String? birthDate,
    String? phoneNumber,
  }) {
    return UserProfile(
      avatar: avatar ?? _avatar,
      name: name ?? _name,
      email: email ?? _email,
      birthDate: birthDate ?? _birthDate,
      phoneNumber: phoneNumber ?? _phoneNumber,
    );
  }

  String get name => _name;
  String get email => _email;
  String get birthDate => _birthDate;
  String get gender => _gender;
  String get phoneNumber => _phoneNumber;
  String get avatar => _avatar;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      avatar: json['avatar'],
      name: json['name'],
      email: json['email'],
      birthDate: json['birthDate'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': _avatar,
      'name': _name,
      'email': _email,
      'birthDate': _birthDate,
      'phoneNumber': _phoneNumber,
      'gender': gender,
    };
  }

  @override
  List<Object?> get props => [
        _avatar,
        _name,
        _email,
        _birthDate,
        _gender,
        _phoneNumber,
      ];
}
