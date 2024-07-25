import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/ui/contact_info/contact_info_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

void showGenderPicker(BuildContext context, ContactInfoViewModel viewModel) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () => viewModel.pickGender(Gender.male),
            leading: const Icon(
              Icons.male,
              color: Colors.blue,
            ),
            title: Text(
              Gender.male.name,
              style: customContentTextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () => viewModel.pickGender(Gender.female),
            leading: const Icon(
              Icons.female,
              color: Colors.pink,
            ),
            title: Text(
              Gender.female.name,
              style: customContentTextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    },
  );
}
