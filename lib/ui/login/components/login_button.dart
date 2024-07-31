import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    return StreamBuilder<bool>(
      stream: viewModel.isAllValidInput,
      builder: (context, snapshot) {
        return SizedBox(
          height: 60.w,
          child: customButton(
            backgroundColor:
                snapshot.data == true ? AppColors.green : AppColors.grey2,
            onPressed: snapshot.data == true
                ? () {
                    viewModel.onValidForm();
                  }
                : () {},
            child: Center(
              child: Text(
                AppLanguages.login,
                style: customContentTextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
