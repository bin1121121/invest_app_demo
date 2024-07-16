import 'package:equatable/equatable.dart';

enum Gender { Male, Female }

class UserProfile extends Equatable {
  String _avatar;
  String _name;
  String _email;
  String _birthDate;
  String _gender;
  String _phoneNumber;
  UserProfile({
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
  String get name => this._name;

  set name(String value) => this._name = value;

  get email => this._email;

  set email(value) => this._email = value;

  get birthDate => this._birthDate;

  set birthDate(value) => this._birthDate = value;

  get gender => this._gender;

  set gender(value) => this._gender = value;

  get phoneNumber => this._phoneNumber;

  set phoneNumber(value) => this._phoneNumber = value;

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
