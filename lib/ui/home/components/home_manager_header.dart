import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/ui/home/home_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:provider/provider.dart';

class HomeManagerHeader extends StatelessWidget {
  const HomeManagerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return Padding(
      padding: EdgeInsets.only(
        right: 30.w,
        left: 30.w,
        top: 50.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.icMenu),
          ),
          GestureDetector(
            onTap: viewModel.onNavigateToNotificationPage,
            child: SvgPicture.asset(AppAssets.icNotifications),
          ),
        ],
      ),
    );
  }
}
