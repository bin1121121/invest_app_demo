import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class AccountCardWidget extends StatelessWidget {
  final String _preIcon;
  final String _title;
  final Function()? _onTap;
  final Color _color;
  AccountCardWidget({
    super.key,
    required String preIcon,
    required String title,
    Function()? onTap,
    Color? color,
  })  : _preIcon = preIcon,
        _title = title,
        _onTap = onTap,
        _color = color ?? AppColors.black1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Card(
        elevation: 2,
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 22.w, 23.w, 22.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    _preIcon,
                    colorFilter: ColorFilter.mode(_color, BlendMode.srcIn),
                  ),
                  SizedBox(width: 35.w),
                  Text(
                    _title,
                    style: customContentTextStyle(
                      color: _color,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                AppAssets.icNext,
                colorFilter: ColorFilter.mode(_color, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
