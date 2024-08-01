import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/helper/validation.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/button_create.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/create_account_option_gender.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_field.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateAccountViewModel>();
    return SingleChildScrollView(
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            SizedBox(height: 20.w),
            Text(
              AppLanguages.createAccount,
              style: CustomTextStyle().headerTextStyle(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.w),
            Text(
              AppLanguages.investAndDouble,
              style: CustomTextStyle().contentTextStyle(color: AppColors.grey1),
            ),
            SizedBox(height: 40.w),
            //input firstName
            CustomTextField(
              controller: viewModel.firstNameController,
              hintText: AppLanguages.firstName,
              validator: ValidationHelper().isFirstNameValidMessage,
              onChanged: (value) => viewModel.isAllInputsValidSink(),
            ),
            SizedBox(height: 18.w),
            CustomTextField(
              controller: viewModel.lastNameController,
              hintText: AppLanguages.lastName,
              validator: ValidationHelper().isLastNameValidMessage,
              onChanged: (value) => viewModel.isAllInputsValidSink(),
            ),
            SizedBox(height: 18.w),
            //option gender
            CreateAccountOptionGender(),
            SizedBox(height: 18.w),
            //input email
            CustomTextField(
              controller: viewModel.emailController,
              hintText: AppLanguages.email,
              validator: ValidationHelper().isEmailValidMessage,
              onChanged: (value) => viewModel.isAllInputsValidSink(),
            ),
            SizedBox(height: 18.w),
            //input password
            CustomTextField(
              hintText: AppLanguages.password,
              controller: viewModel.passwordController,
              isPasswordVisible: viewModel.isPasswordVisible,
              onChanged: (value) => viewModel.isAllInputsValidSink(),
              validator: ValidationHelper().isPasswordValidMessage,
              onPressedChangeVisibility: viewModel.changePasswordVisibility,
            ),
            SizedBox(height: 18.w),
            //input confirm password
            CustomTextField(
              hintText: AppLanguages.confirmPassword,
              controller: viewModel.confirmPasswordController,
              isPasswordVisible: viewModel.isConfirmPasswordVisible,
              onChanged: (value) => viewModel.isAllInputsValidSink(),
              validator: (value) =>
                  ValidationHelper().isConfirmPasswordValidMessage(
                viewModel.passwordController.text,
                value,
              ),
              onPressedChangeVisibility:
                  viewModel.changeConfirmPasswordVisibility,
            ),
            SizedBox(height: 30.w),
            //create button
            const ButtonCreate(),
            SizedBox(height: 20.w),
            //text button
            CustomTextButton(
              text: AppLanguages.alreadyHaveAnCount,
              onPressed: viewModel.onNavigateToLogin,
              color: AppColors.green,
            )
          ],
        ),
      ),
    );
  }
}
