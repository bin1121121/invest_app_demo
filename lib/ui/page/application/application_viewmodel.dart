import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/page/account/account_page.dart';
import 'package:invest_app_flutter_test/ui/page/home/home_page.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class ApplicationViewModel extends BaseViewModel {
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.ic_home),
      label: AppLanguages.home,
      activeIcon: SvgPicture.asset(
        AppAssets.ic_home,
        colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
        // fit: BoxFit.contain,
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.ic_search_outline),
      label: AppLanguages.product,
      activeIcon: SvgPicture.asset(
        AppAssets.ic_search_outline,
        colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.ic_transaction_outline),
      label: AppLanguages.transaction,
      activeIcon: SvgPicture.asset(
        AppAssets.ic_transaction_outline,
        colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.ic_profile_outline),
      label: AppLanguages.account,
      activeIcon: SvgPicture.asset(
        AppAssets.ic_profile_outline,
        colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn),
      ),
    ),
  ];
  final List<Widget> _pageList = [
    HomePage(),
    Scaffold(
      body: Center(
        child: Text("Product"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Transaction"),
      ),
    ),
    AccountPage(),
  ];

  late final PageController _pageController =
      PageController(initialPage: _currentPage);
  int _currentPage = 0;

  void onPageChanged(int value) {
    _currentPage = value;
    notifyListeners();
  }

  void onNavBarTap(int index) {
    _pageController.jumpToPage(index);
  }

  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      _bottomNavigationBarItems;
  List<Widget> get pageList => _pageList;
  PageController get pageController => _pageController;
  int get currentPage => _currentPage;
}
