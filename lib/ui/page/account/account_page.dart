import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/page/account/account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/page/account/components/account_avatar_widget.dart';
import 'package:invest_app_flutter_test/ui/page/account/components/account_card_widget.dart';
import 'package:invest_app_flutter_test/ui/page/account/components/account_user_name_widget.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_fonts.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AccountViewModel>(
      viewModel: AccountViewModel(),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.w),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLanguages.profile,
                      style: customHeaderTextStyle(color: AppColors.black),
                    ),
                  ),
                  SizedBox(height: 30.w),
                  AccountAvatarWidget(
                    viewModel: viewModel,
                  ),
                  SizedBox(height: 20.w),
                  AccountUserNameWidget(
                    viewModel: viewModel,
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    AppLanguages.expert,
                    style: customContentTextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.Open_Sans,
                    ),
                  ),
                  SizedBox(height: 20.w),
                  AccountCardWidget(
                    preIcon: AppAssets.ic_contact,
                    title: AppLanguages.contactInfo,
                    onTap: () => Navigator.of(context)
                        .pushNamed(RouteName.contactInfoPage),
                  ),
                  SizedBox(height: 10.w),
                  AccountCardWidget(
                    preIcon: AppAssets.ic_funding,
                    title: AppLanguages.sourceOfFoundingInfo,
                    onTap: () async {
                      await viewModel.getCurrentAuthUser();
                    },
                  ),
                  SizedBox(height: 10.w),
                  AccountCardWidget(
                    preIcon: AppAssets.ic_bank,
                    title: AppLanguages.bankAccountInfo,
                  ),
                  SizedBox(height: 10.w),
                  AccountCardWidget(
                    preIcon: AppAssets.ic_doc,
                    title: AppLanguages.documentInfo,
                  ),
                  SizedBox(height: 10.w),
                  AccountCardWidget(
                    preIcon: AppAssets.ic_setting,
                    title: AppLanguages.settings,
                  ),
                  SizedBox(height: 10.w),
                  AccountCardWidget(
                    preIcon: AppAssets.ic_logout,
                    title: AppLanguages.logout,
                    color: AppColors.red,
                    onTap: () {
                      viewModel.logOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
