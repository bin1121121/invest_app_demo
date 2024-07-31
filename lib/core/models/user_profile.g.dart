// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      birthDate: json['birthDate'] as String,
      gender: $enumDecodeNullable(_$GenderTypeEnumMap, json['gender']),
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'name': instance.name,
      'email': instance.email,
      'birthDate': instance.birthDate,
      'gender': _$GenderTypeEnumMap[instance.gender],
      'phoneNumber': instance.phoneNumber,
    };

const _$GenderTypeEnumMap = {
  GenderType.male: 'male',
  GenderType.female: 'female',
};
