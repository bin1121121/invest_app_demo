import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

void customShowLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Center(
        child: CircularProgressIndicator(
          color: AppColors.green,
        ),
      );
    },
  );
}
