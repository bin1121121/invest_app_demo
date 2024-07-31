import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

void showImagePicker(BuildContext context, ContactInfoViewModel viewModel) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(
              AppLanguages.camera,
              style: customContentTextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () => viewModel.pickImage(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: Text(
              AppLanguages.gallery,
              style: customContentTextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () => viewModel.pickImage(ImageSource.gallery),
          ),
        ],
      );
    },
  );
}
