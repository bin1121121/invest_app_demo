import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/button_create.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/create_account_option_gender.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/icon_button_pre_page.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/input_password_text_field.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';

class CreateAccountView extends StatelessWidget {
  final CreateAccountViewModel _viewModel;
  const CreateAccountView({
    super.key,
    required CreateAccountViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _viewModel.formKey,
        child: Column(
          children: [
            SizedBox(height: 50.w),
            const IconButtonPrePage(),
            SizedBox(height: 20.w),
            Text(
              AppString.createAccount,
              style: customHeaderTextStyle(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.w),
            Text(
              AppString.investAndDouble,
              style: customContentTextStyle(color: AppColors.grey1),
            ),
            SizedBox(height: 87.w),
            //input firstname
            TextFormField(
              controller: _viewModel.firstNameController,
              decoration: const InputDecoration(
                labelText: AppString.firstName,
              ),
              validator: (value) => _viewModel.validFirstName(value),
              onChanged: (value) => _viewModel.setFirstName(value),
            ),
            SizedBox(height: 18.w),
            TextFormField(
              controller: _viewModel.lastNameController,
              decoration: const InputDecoration(
                labelText: AppString.lastName,
              ),
              validator: (value) => _viewModel.validLastName(value),
              onChanged: (value) => _viewModel.setLastName(value),
            ),
            SizedBox(height: 18.w),
            //option gender
            CreateAccountOptionGender(viewModel: _viewModel),
            SizedBox(height: 18.w),
            //input email
            TextFormField(
              controller: _viewModel.emailController,
              decoration: const InputDecoration(
                labelText: AppString.email,
              ),
              validator: (value) => _viewModel.validEmail(value),
              onChanged: (value) => _viewModel.setEmail(value),
            ),
            SizedBox(height: 18.w),
            //input password
            InPutPasswordTextField(
              texEditingController: _viewModel.passwordController,
              isVisible: _viewModel.isPasswordVisible,
              labelText: AppString.password,
              onChangeVisibility: () => _viewModel.changePasswordVisibility(),
              validator: (value) => _viewModel.validPassword(value),
              onChangeTextField: (value) => _viewModel.setPassword(value),
            ),
            SizedBox(height: 18.w),
            //input confirm password
            InPutPasswordTextField(
              texEditingController: _viewModel.confirmPasswordController,
              isVisible: _viewModel.isConfirmPasswordVisible,
              labelText: AppString.confirmPassword,
              onChangeVisibility: () =>
                  _viewModel.changeConfirmPasswordVisibility(),
              validator: (value) => _viewModel.validConfirmPassword(value),
              onChangeTextField: (value) =>
                  _viewModel.setConfirmPassword(value),
            ),
            SizedBox(height: 30.w),
            //create button
            ButtonCreate(
              viewModel: _viewModel,
              formKey: _viewModel.formKey,
            ),
            SizedBox(height: 20.w),
            //text button
            customTextButton(
              text: AppString.alreadyHaveAnCount,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.loginPage);
              },
              color: AppColors.green,
            )
          ],
        ),
      ),
    );
  }
}
