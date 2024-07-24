import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_button.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_textfield_password.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_textfield_username.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_button.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel _viewModel;
  const LoginView({
    super.key,
    required LoginViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Form(
            key: _viewModel.formKey,
            child: Column(
              children: [
                SizedBox(height: 106.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Image.asset(AppAssets.img_logo_group),
                ),
                SizedBox(height: 63.w),
                LoginTextFieldUserName(viewModel: _viewModel),
                SizedBox(height: 20.w),
                LoginTextFieldPassword(viewModel: _viewModel),
                SizedBox(height: 90.w),
                LoginButton(viewModel: _viewModel),
                SizedBox(height: 30.w),
                customTextButton(
                  text: AppLanguages.iDontHaveAnAccount,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteName.createAccountPage);
                  },
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
