import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/page/utils/valid_input.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_const.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ContactInfoViewModel extends BaseViewModel {
  late GlobalKey<FormState> _formKey;
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _birthDateTextController =
      TextEditingController();
  final TextEditingController _genderTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  late final AppShared _appShared;
  File _image = File("");

  Future onInit() async {
    _formKey = GlobalKey<FormState>();
    _appShared = Provider.of<AppShared>(context, listen: false);

    _image = File(await _appShared.getString(STORAGE_AVATAR) ?? "");
    _userNameTextController.text =
        await _appShared.getString(STORAGE_USER_NAME) ?? "";
    _birthDateTextController.text =
        await _appShared.getString(STORAGE_BIRTH_DATE) ?? "";
    _genderTextController.text =
        await _appShared.getString(STORAGE_GENDER) ?? "";
    _emailTextController.text = await _appShared.getString(STORAGE_EMAIL) ?? "";
    _phoneNumberTextController.text =
        await _appShared.getString(STORAGE_PHONE_NUMBER) ?? "";
    notifyListeners();
  }

  Future<bool> _requestPermission(ImageSource imageSource) async {
    if (imageSource == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (status == PermissionStatus.granted) {
        return true;
      }
    } else if (imageSource == ImageSource.gallery) {
      final status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      _requestPermission(imageSource).then(
        (value) async {
          if (value == true) {
            final XFile? image =
                await ImagePicker().pickImage(source: imageSource);
            if (image == null) return;
            _image = File(image.path);
            notifyListeners();
          }
        },
      );
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void dateFormatter(DateTime? date) {
    if (date == null) return;
    DateFormat dateFormat = DateFormat("dd MMMM yyyy");
    birthDateTextController.text = dateFormat.format(date);
  }

  void pickGender(Gender gender) {
    _genderTextController.text = gender.name;
    Navigator.pop(context);
  }

  String? validUserName(String? value) {
    if (!isUserNameValid(value ?? "")) {
      return AppString.userNameError;
    }
    return null;
  }

  String? validEmail(String? value) {
    if (!isEmailValid(value ?? "")) {
      return AppString.emailError;
    }
    return null;
  }

  String? validPhoneNumber(String? value) {
    if (!isPhoneNumberValid(value ?? "")) {
      return AppString.phoneNumberError;
    }
    return null;
  }

  String? validBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.birthDateError;
    }
    return null;
  }

  String? validGender(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.genderError;
    }
    return null;
  }

  Future onSave() async {
    UserProfile oldUserProfile = UserProfile(
      avatar: await _appShared.getString(STORAGE_AVATAR),
      name: await _appShared.getString(STORAGE_USER_NAME),
      email: await _appShared.getString(STORAGE_EMAIL),
      birthDate: await _appShared.getString(STORAGE_BIRTH_DATE),
      gender: await _appShared.getString(STORAGE_GENDER),
      phoneNumber: await _appShared.getString(STORAGE_PHONE_NUMBER),
    );
    UserProfile newUserProfile = UserProfile(
      avatar: _image.path,
      name: _userNameTextController.text,
      email: _emailTextController.text,
      birthDate: _birthDateTextController.text,
      gender: _genderTextController.text,
      phoneNumber: _phoneNumberTextController.text,
    );
    if (_formKey.currentState!.validate() &&
        (oldUserProfile != newUserProfile)) {
      await _appShared.setString(STORAGE_AVATAR, _image.path);
      await _appShared.setString(STORAGE_USER_NAME, newUserProfile.name);
      await _appShared.setString(STORAGE_EMAIL, newUserProfile.email);
      await _appShared.setString(STORAGE_BIRTH_DATE, newUserProfile.birthDate);
      await _appShared.setString(STORAGE_GENDER, newUserProfile.gender);
      await _appShared.setString(
          STORAGE_PHONE_NUMBER, newUserProfile.phoneNumber);
      customToast(message: "Update Success", backgroundColor: AppColors.green);
    } else {
      print("Something went wrong");
    }
  }

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get userNameTextController => _userNameTextController;
  TextEditingController get birthDateTextController => _birthDateTextController;
  TextEditingController get genderTextController => _genderTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get phoneNumberTextController =>
      _phoneNumberTextController;

  File get image => _image;
}