import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';

class IconButtonPrePage extends StatelessWidget {
  const IconButtonPrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(5.w),
        alignment: Alignment.centerLeft,
        child: SvgPicture.asset(AppAssets.icPre),
      ),
    );
  }
}
