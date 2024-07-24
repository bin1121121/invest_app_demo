import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';

class ManagerHeader extends StatelessWidget {
  const ManagerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            child: SvgPicture.asset(AppAssets.ic_menu),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(RouteName.notificationPage),
            child: SvgPicture.asset(AppAssets.ic_notifications),
          ),
        ],
      ),
    );
  }
}
