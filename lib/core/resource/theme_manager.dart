import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/resource/color_manager.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';

ThemeData getApplicationTheme() {
  return ThemeData().copyWith(
    //button theme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     textStyle: customContentTextStyle(color: ColorManager.white),
    //     disabledBackgroundColor: ColorManager.grey1,
    //     backgroundColor: ColorManager.green,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //   ),
    // ),

    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 25),
      hintStyle: customContentTextStyle(
          color: ColorManager.grey2, fontWeight: FontWeight.w400),
      labelStyle: customContentTextStyle(
          color: ColorManager.grey2, fontWeight: FontWeight.w400),
      errorStyle: customContentTextStyle(
        color: ColorManager.red,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey2, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.green, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.red, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.green, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
