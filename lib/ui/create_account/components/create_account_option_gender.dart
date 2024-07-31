import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/type/gender_type.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class CreateAccountOptionGender extends StatelessWidget {
  const CreateAccountOptionGender({super.key});

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
            value: Gender.male,
            groupValue: viewModel.genderValue,
            onChanged: viewModel.onChangeSelectedGender,
          ),
          title: Text(
            Gender.male.name,
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
            value: Gender.female,
            groupValue: viewModel.genderValue,
            onChanged: viewModel.onChangeSelectedGender,
          ),
          title: Text(
            Gender.female.name,
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
