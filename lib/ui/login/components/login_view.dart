import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_button.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_textfield_password.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_textfield_username.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_button.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                SizedBox(height: 106.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Image.asset(AppAssets.imgLogoGroup),
                ),
                SizedBox(height: 63.w),
                const LoginTextFieldUserName(),
                SizedBox(height: 20.w),
                LoginTextFieldPassword(),
                SizedBox(height: 90.w),
                const LoginButton(),
                SizedBox(height: 30.w),
                customTextButton(
                  text: AppLanguages.iDoNotHaveAnAccount,
                  onPressed: viewModel.onNavigateToCreateAccount,
                  color: AppColors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
