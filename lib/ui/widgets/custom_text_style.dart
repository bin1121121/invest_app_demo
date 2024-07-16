import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/utils/app_fonts.dart';

TextStyle customHeaderTextStyle({double fontSize = 34, required Color color}) {
  return TextStyle(
    fontFamily: AppFonts.DM_Sans,
    color: color,
    height: 1,
    fontSize: fontSize.w,
    fontWeight: FontWeight.bold,
  );
}

TextStyle customContentTextStyle({
  required Color color,
  double fontSize = 17,
  FontWeight fontWeight = FontWeight.w600,
  String fontFamily = AppFonts.SF_Pro_Text,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    height: 1,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
