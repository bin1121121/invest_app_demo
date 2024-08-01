import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';

class ApplicationViewModel extends BaseViewModel {
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

  PageController get pageController => _pageController;
  int get currentPage => _currentPage;
}
