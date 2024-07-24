import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/page/home/home_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    super.key,
    required HomeViewmodel homeViewmodel,
  }) : _homeViewmodel = homeViewmodel;

  final HomeViewmodel _homeViewmodel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: _homeViewmodel.userNameStream,
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
