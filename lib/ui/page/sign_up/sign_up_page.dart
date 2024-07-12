import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/resource/asset_img.dart';
import 'package:invest_app_flutter_test/core/resource/color_manager.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(51.w, 155.w, 51.w, 0.w),
              child: Image.asset(AssetImg.img_layer_1),
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
                "Stay on top of your finance with us.",
                style: customHeaderTextStyle(color: ColorManager.black),
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
                "We are your new financial Advisors to recommed the best investments for you.",
                style: customContentTextStyle(
                  color: ColorManager.grey1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 79.w,
            ),
            Container(
              width: double.infinity,
              height: 60.w,
              margin: EdgeInsets.symmetric(
                horizontal: 26.sp,
              ),
              child: customButtom(
                backgroundColor: ColorManager.green,
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.createAccountPage);
                },
                child: Center(
                  child: Text(
                    "Create account",
                    style: customContentTextStyle(color: ColorManager.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 17.w),
            Text(
              "Login",
              style: customContentTextStyle(
                color: ColorManager.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
