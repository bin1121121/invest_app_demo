import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/page/login/login_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      onViewModelReady: (viewModel) => viewModel.onInit(),
      viewModel: LoginViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 106.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Image.asset(AppAssets.img_logo_group),
                  ),
                  SizedBox(height: 63.w),
                  TextFormField(
                    controller: viewModel.userNameTextEditingController,
                    decoration: const InputDecoration(
                      labelText: AppLanguages.userName,
                    ),
                  ),
                  SizedBox(height: 20.w),
                  TextFormField(
                    obscureText: viewModel.isPasswordVisible,
                    controller: viewModel.passwordTextEditingController,
                    decoration: InputDecoration(
                      labelText: AppLanguages.password,
                      suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.changePasswordVisibility();
                        },
                        icon: Icon(
                          viewModel.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 90.w),
                  SizedBox(
                    height: 60.w,
                    child: customButton(
                      backgroundColor: AppColors.green,
                      onPressed: () {
                        viewModel.onLogin();
                      },
                      child: Center(
                        child: Text(
                          AppLanguages.login,
                          style: customContentTextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
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
        );
      },
    );
  }
}
