import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/application/application_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final ApplicationViewModel _viewModel;
  const BottomNavBar({
    super.key,
    required ApplicationViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _viewModel.bottomNavigationBarItems,
      selectedItemColor: AppColors.green,
      onTap: (value) => _viewModel.onNavBarTap(value),
      currentIndex: _viewModel.currentPage,

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
