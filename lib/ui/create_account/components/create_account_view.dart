import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/button_create.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/create_account_option_gender.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/icon_button_pre_page.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/input_password_text_field.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_field.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateAccountViewModel>();
    return SingleChildScrollView(
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            SizedBox(height: 50.w),
            const IconButtonPrePage(),
            SizedBox(height: 20.w),
            Text(
              AppLanguages.createAccount,
              style: customHeaderTextStyle(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.w),
            Text(
              AppLanguages.investAndDouble,
              style: customContentTextStyle(color: AppColors.grey1),
            ),
            SizedBox(height: 87.w),
            //input firstname
            CustomTextField(
              controller: viewModel.firstNameController,
              hintText: AppLanguages.firstName,
              validator: (value) => viewModel.validFirstName(value),
              onChanged: (value) => viewModel.setFirstName(value),
            ),
            SizedBox(height: 18.w),
            CustomTextField(
              controller: viewModel.lastNameController,
              hintText: AppLanguages.lastName,
              validator: (value) => viewModel.validLastName(value),
              onChanged: (value) => viewModel.setLastName(value),
            ),
            SizedBox(height: 18.w),
            //option gender
            const CreateAccountOptionGender(),
            SizedBox(height: 18.w),
            //input email
            CustomTextField(
              controller: viewModel.emailController,
              hintText: AppLanguages.email,
              validator: (value) => viewModel.validEmail(value),
              onChanged: (value) => viewModel.setEmail(value),
            ),
            SizedBox(height: 18.w),
            //input password
            CustomTextField(
              hintText: AppLanguages.password,
              controller: viewModel.passwordController,
              isPasswordVisible: viewModel.isPasswordVisible,
              onChanged: (value) => viewModel.setPassword(value),
              validator: (value) => viewModel.validPassword(value),
              onPressedChangeVisibility: () =>
                  viewModel.changePasswordVisibility(),
            ),
            SizedBox(height: 18.w),
            //input confirm password
            InPutPasswordTextField(
              texEditingController: viewModel.confirmPasswordController,
              isVisible: viewModel.isConfirmPasswordVisible,
              labelText: AppLanguages.confirmPassword,
              onChangeVisibility: () =>
                  viewModel.changeConfirmPasswordVisibility(),
              validator: (value) => viewModel.validConfirmPassword(value),
              onChangeTextField: (value) => viewModel.setConfirmPassword(value),
            ),
            SizedBox(height: 30.w),
            //create button
            const ButtonCreate(),
            SizedBox(height: 20.w),
            //text button
            customTextButton(
              text: AppLanguages.alreadyHaveAnCount,
              onPressed: () => viewModel.onNavigateToLogin(),
              color: AppColors.green,
            )
          ],
        ),
      ),
    );
  }
}
