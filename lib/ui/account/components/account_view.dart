import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/account/account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/account/components/account_avatar_widget.dart';
import 'package:invest_app_flutter_test/ui/account/components/account_card_widget.dart';
import 'package:invest_app_flutter_test/ui/account/components/account_user_name_widget.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_fonts.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AccountViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          AppLanguages.profile,
          style: customHeaderTextStyle(color: AppColors.black),
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.w, 0.w, 30.w, 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.w),
            const AccountAvatarWidget(),
            SizedBox(height: 20.w),
            const AccountUserNameWidget(),
            SizedBox(height: 10.w),
            Text(
              AppLanguages.expert,
              style: customContentTextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.openSansFont,
              ),
            ),
            SizedBox(height: 20.w),
            AccountCardWidget(
              preIcon: AppAssets.icContact,
              title: AppLanguages.contactInfo,
              onTap: viewModel.onNavigateToContactInfoPage,
            ),
            SizedBox(height: 10.w),
            AccountCardWidget(
              preIcon: AppAssets.icFunding,
              title: AppLanguages.sourceOfFoundingInfo,
              onTap: () async {
                // await _viewModel.getCurrentAuthUser();
              },
            ),
            SizedBox(height: 10.w),
            AccountCardWidget(
              preIcon: AppAssets.icBank,
              title: AppLanguages.bankAccountInfo,
            ),
            SizedBox(height: 10.w),
            AccountCardWidget(
              preIcon: AppAssets.icDoc,
              title: AppLanguages.documentInfo,
            ),
            SizedBox(height: 10.w),
            AccountCardWidget(
              preIcon: AppAssets.icSetting,
              title: AppLanguages.settings,
            ),
            SizedBox(height: 10.w),
            AccountCardWidget(
              preIcon: AppAssets.icLogout,
              title: AppLanguages.logout,
              color: AppColors.red,
              onTap: viewModel.onLogOut,
            ),
          ],
        ),
      ),
    );
  }
}
