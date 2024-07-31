import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:invest_app_flutter_test/core/type/gender_type.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile extends Equatable {
  final String avatar;
  final String name;
  final String email;
  final String birthDate;
  final GenderType? gender;
  final String phoneNumber;
  const UserProfile({
    required this.avatar,
    required this.name,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.phoneNumber,
  });

  UserProfile copyWith({
    String? avatar,
    String? name,
    String? email,
    String? birthDate,
    GenderType? gender,
    String? phoneNumber,
  }) {
    return UserProfile(
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @override
  List<Object?> get props => [
        avatar,
        name,
        email,
        birthDate,
        gender,
        phoneNumber,
      ];
}
