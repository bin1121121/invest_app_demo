import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/models/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class HomeWelcomeTitle extends StatelessWidget {
  const HomeWelcomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return StreamBuilder<String?>(
      stream: viewModel.userNameStream,
      builder: (context, snapshot) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            right: 30.w,
            left: 30.w,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "${AppLanguages.welcome} ${snapshot.data ?? ""}",
              style: customHeaderTextStyle(color: AppColors.black),
              textAlign: TextAlign.start,
            ),
          ),
        );
      },
    );
  }
}
