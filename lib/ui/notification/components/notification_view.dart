import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/icon_button_pre_page.dart';
import 'package:invest_app_flutter_test/ui/notification/components/notification_list_view_widget.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 50.w),
            const IconButtonPrePage(),
            SizedBox(height: 20.w),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLanguages.notification,
                style: customHeaderTextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 20.w),
            const Expanded(
              child: NotificationListViewWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
