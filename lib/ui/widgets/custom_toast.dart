import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class CustomToast {
  void toast({required String message, required Color backgroundColor}) {
    Fluttertoast.showToast(
      fontSize: 18.sp,
      msg: message,
      backgroundColor: backgroundColor,
      gravity: ToastGravity.TOP,
      textColor: AppColors.white,
    );
  }
}
