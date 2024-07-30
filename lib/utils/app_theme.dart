import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class AppTheme {
  ThemeData getApplicationTheme() {
    return ThemeData().copyWith(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.green,
      ),
      //button theme
      buttonTheme: ButtonThemeData(
        disabledColor: AppColors.grey1,
        buttonColor: AppColors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      //input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 2,
        contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 25),
        hintStyle: customContentTextStyle(
            color: AppColors.grey2, fontWeight: FontWeight.w400),
        labelStyle: customContentTextStyle(
            color: AppColors.grey2, fontWeight: FontWeight.w400),
        errorStyle: customContentTextStyle(
          color: AppColors.red,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey2, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.green, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.green, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
