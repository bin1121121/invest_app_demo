import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/button_create.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/icon_button_pre_page.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/input_password_text_field.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CreateAccountViewModel>(
      viewModel: CreateAccountViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
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
                    //input fullname
                    TextFormField(
                      controller: viewModel.userNameController,
                      decoration: const InputDecoration(
                        labelText: AppString.fullName,
                      ),
                      validator: (value) => viewModel.validFullName(value),
                      onChanged: (value) => viewModel.setUserName(value),
                    ),
                    SizedBox(height: 18.w),
                    //input email
                    TextFormField(
                      controller: viewModel.emailController,
                      decoration: const InputDecoration(
                        labelText: AppString.email,
                      ),
                      validator: (value) => viewModel.validEmail(value),
                      onChanged: (value) => viewModel.setEmail(value),
                    ),
                    SizedBox(height: 18.w),
                    //input password
                    InPutPasswordTextField(
                      passwordController: viewModel.passwordController,
                      createAccountViewmodel: viewModel,
                    ),
                    SizedBox(height: 30.w),
                    //create button
                    ButtonCreate(
                      createAccountViewmodel: viewModel,
                      formKey: viewModel.formKey,
                    ),
                    SizedBox(height: 40.w),
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
            ),
          ),
        );
      },
    );
  }
}
