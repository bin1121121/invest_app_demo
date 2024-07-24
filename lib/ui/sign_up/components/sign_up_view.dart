import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/sign_up/components/create_account_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/ui/widgets/exnpanded_child_scroll_view.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandedChildScrollView(
        padding: EdgeInsets.only(bottom: 20.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(51.w, 155.w, 51.w, 0.w),
              child: Image.asset(AppAssets.img_layer_1),
            ),
            SizedBox(
              height: 38.sp,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 41.sp,
                right: 19.sp,
              ),
              child: Text(
                AppLanguages.stayOnTop,
                style: customHeaderTextStyle(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 17.sp,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 41.sp,
                right: 19.sp,
              ),
              child: Text(
                AppLanguages.weAreYourNewFinancial,
                style: customContentTextStyle(
                  color: AppColors.grey1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 79.w,
            ),
            const CreateAccountButton(),
            SizedBox(height: 17.w),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteName.loginPage);
              },
              child: Text(
                AppLanguages.login,
                style: customContentTextStyle(
                  color: AppColors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
