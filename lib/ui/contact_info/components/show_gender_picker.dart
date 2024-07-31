import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/type/gender_type.dart';
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
            onTap: () => viewModel.pickGender(GenderType.male),
            leading: const Icon(
              Icons.male,
              color: Colors.blue,
            ),
            title: Text(
              GenderType.male.name,
              style: customContentTextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () => viewModel.pickGender(GenderType.female),
            leading: const Icon(
              Icons.female,
              color: Colors.pink,
            ),
            title: Text(
              GenderType.female.name,
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
