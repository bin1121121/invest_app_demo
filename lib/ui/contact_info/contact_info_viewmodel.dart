import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invest_app_flutter_test/core/type/gender_type.dart';
import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/utils/date_format.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_toast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class ContactInfoViewModel extends BaseViewModel {
  late GlobalKey<FormState> _formKey;
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _birthDateTextController =
      TextEditingController();
  final TextEditingController _genderTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  File? _imageFile;
  final BehaviorSubject<bool> _enableSaveButtonSubject =
      BehaviorSubject<bool>.seeded(false);
  Future onInit() async {
    _formKey = GlobalKey<FormState>();
    await AppShared().getUserProfile().then((userProfile) {
      _userNameTextController.text = userProfile?.name ?? "";
      _birthDateTextController.text = userProfile?.birthDate ?? "";
      _genderTextController.text = userProfile?.gender.name ?? "";
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
    _requestPermission(imageSource).then(
      (value) async {
        if (value == true) {
          final XFile? image =
              await ImagePicker().pickImage(source: imageSource);
          if (image == null) return;
          _imageFile = File(image.path);
          notifyListeners();
          isAllInputValidSink();
        }
      },
    ).catchError((error) {
      debugPrint("Error: $error");
    });
  }

  void isAllInputValidSink() {
    if (_userNameTextController.text.isNotEmpty &&
            _birthDateTextController.text.isNotEmpty &&
            _genderTextController.text.isNotEmpty &&
            _emailTextController.text.isNotEmpty &&
            _phoneNumberTextController.text.isNotEmpty ||
        _imageFile != null) {
      _enableSaveButtonSubject.add(true);
    } else {
      _enableSaveButtonSubject.add(false);
    }
  }

  Future selectedDate() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (dateTime != null) {
      _birthDateTextController.text = dateFormatted(dateTime);
    }
  }

  void pickGender(GenderType gender) {
    _genderTextController.text = gender.name;
    Navigator.pop(context);
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
      gender: GenderType.values.byName(_genderTextController.text),
      phoneNumber: _phoneNumberTextController.text,
      avatar: oldUserProfile.avatar,
    );
    if (_formKey.currentState!.validate() &&
        (oldUserProfile != newUserProfile)) {
      await AppShared().setUserProfile(newUserProfile);
      CustomToast().toast(
          message: AppLanguages.updateSuccess,
          backgroundColor: AppColors.green);
      if (!context.mounted) return;
      Navigator.of(context).pop();
    } else {
      debugPrint("Something went wrong");
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

  BehaviorSubject<bool> get enableSaveButtonSubject => _enableSaveButtonSubject;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get userNameTextController => _userNameTextController;
  TextEditingController get birthDateTextController => _birthDateTextController;
  TextEditingController get genderTextController => _genderTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get phoneNumberTextController =>
      _phoneNumberTextController;

  File? get imageFile => _imageFile;
}
