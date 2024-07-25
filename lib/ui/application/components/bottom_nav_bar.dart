import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/models/application_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplicationViewModel>();
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: viewModel.bottomNavigationBarItems,
      selectedItemColor: AppColors.green,
      onTap: (value) => viewModel.onNavBarTap(value),
      currentIndex: viewModel.currentPage,

      // selectedLabelStyle: customContentTextStyle(
      //   color: AppColors.green,
      //   fontSize: 12,
      //   fontWeight: FontWeight.w500,
      //   fontFamily: AppFonts.Catamaran,
      // ),
      // unselectedLabelStyle: customContentTextStyle(
      //   color: AppColors.grey1,
      //   fontSize: 12,
      //   fontWeight: FontWeight.w500,
      //   fontFamily: AppFonts.Catamaran,
      // ),
    );
  }
}
