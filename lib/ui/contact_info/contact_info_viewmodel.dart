import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invest_app_flutter_test/core/helper/validation.dart';
import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/utils/date_format.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactInfoViewModel extends BaseViewModel {
  late GlobalKey<FormState> _formKey;
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _birthDateTextController =
      TextEditingController();
  final TextEditingController _genderTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  File _image = File("");

  Future onInit() async {
    _formKey = GlobalKey<FormState>();
    await AppShared().getUserProfile().then((userProfile) {
      _userNameTextController.text = userProfile?.name ?? "";
      _birthDateTextController.text = userProfile?.birthDate ?? "";
      _genderTextController.text = userProfile?.gender ?? "";
      _emailTextController.text = userProfile?.email ?? "";
      _phoneNumberTextController.text = userProfile?.phoneNumber ?? "";
    });
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
    birthDateTextController.text = dateFormatted(date);
  }

  void pickGender(Gender gender) {
    _genderTextController.text = gender.name;
    Navigator.pop(context);
  }

  String? validUserName(String? value) {
    if (!ValidationHelper().isUserNameValid(value ?? "")) {
      return AppLanguages.firstNameError;
    }
    return null;
  }

  String? validEmail(String? value) {
    if (!ValidationHelper().isEmailValid(value ?? "")) {
      return AppLanguages.emailError;
    }
    return null;
  }

  String? validPhoneNumber(String? value) {
    if (!ValidationHelper().isPhoneNumberValid(value ?? "")) {
      return AppLanguages.phoneNumberError;
    }
    return null;
  }

  String? validBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return AppLanguages.birthDateError;
    }
    return null;
  }

  String? validGender(String? value) {
    if (value == null || value.isEmpty) {
      return AppLanguages.genderError;
    }
    return null;
  }

  Future onSave() async {
    UserProfile oldUserProfile = UserProfile();
    await AppShared().getUserProfile().then((userProfile) {
      oldUserProfile = userProfile ?? UserProfile();
    });
    UserProfile newUserProfile = UserProfile(
      name: _userNameTextController.text,
      email: _emailTextController.text,
      birthDate: _birthDateTextController.text,
      gender: _genderTextController.text,
      phoneNumber: _phoneNumberTextController.text,
    );
    if (_formKey.currentState!.validate() &&
        (oldUserProfile != newUserProfile)) {
      await AppShared().setUserProfile(newUserProfile);
      customToast(message: "Update Success", backgroundColor: AppColors.green);
      Navigator.of(context).pop();
    } else {
      print("Something went wrong");
    }
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _birthDateTextController.dispose();
    _genderTextController.dispose();
    _emailTextController.dispose();
    _phoneNumberTextController.dispose();
    super.dispose();
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
