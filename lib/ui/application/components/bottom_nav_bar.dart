import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/ui/application/application_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplicationViewModel>();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.icHome),
          label: AppLanguages.home,
          activeIcon: SvgPicture.asset(
            AppAssets.icHome,
            colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.icSearchOutline),
          label: AppLanguages.product,
          activeIcon: SvgPicture.asset(
            AppAssets.icSearchOutline,
            colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.icTransactionOutline),
          label: AppLanguages.transaction,
          activeIcon: SvgPicture.asset(
            AppAssets.icTransactionOutline,
            colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.icProfileOutline),
          label: AppLanguages.account,
          activeIcon: SvgPicture.asset(
            AppAssets.icProfileOutline,
            colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
          ),
        ),
      ],
      selectedItemColor: AppColors.green,
      onTap: viewModel.onNavBarTap,
      currentIndex: viewModel.currentPage,
    );
  }
}
