import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.w,
      margin: EdgeInsets.symmetric(
        horizontal: 26.sp,
      ),
      child: customButton(
        backgroundColor: AppColors.green,
        onPressed: () {
          Navigator.pushNamed(context, RouteName.createAccountPage);
        },
        child: Center(
          child: Text(
            AppLanguages.createAccount,
            style: customContentTextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
