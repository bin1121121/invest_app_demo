import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class TotalAsset extends StatelessWidget {
  const TotalAsset({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.fromLTRB(30.w, 30.w, 15.w, 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.green2,
            AppColors.green1,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.green3.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLanguages.yourTotalAsset,
            style: customContentTextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "N203,935",
                style: customContentTextStyle(
                    color: AppColors.white, fontSize: 32.w),
              ),
              customButton(
                backgroundColor: AppColors.white,
                onPressed: () {},
                radius: 15.w,
                child: Text(
                  AppLanguages.investNow,
                  style: customContentTextStyle(
                    color: AppColors.green1,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
