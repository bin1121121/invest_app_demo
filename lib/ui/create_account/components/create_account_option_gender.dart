import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/models/user_profile.dart';
import 'package:invest_app_flutter_test/core/models/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class CreateAccountOptionGender extends StatelessWidget {
  const CreateAccountOptionGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateAccountViewModel>();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLanguages.gender,
            style: customContentTextStyle(
                color: AppColors.grey2, fontWeight: FontWeight.w400),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Radio(
            activeColor: AppColors.green,
            value: Gender.Male,
            groupValue: viewModel.genderValue,
            onChanged: (value) =>
                viewModel.onChangeSelectedGender(value as Gender),
          ),
          title: Text(
            Gender.Male.name,
            style: customContentTextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Radio(
            activeColor: AppColors.green,
            value: Gender.Female,
            groupValue: viewModel.genderValue,
            onChanged: (value) =>
                viewModel.onChangeSelectedGender(value as Gender),
          ),
          title: Text(
            Gender.Female.name,
            style: customContentTextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
