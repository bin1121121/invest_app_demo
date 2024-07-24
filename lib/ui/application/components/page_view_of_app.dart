import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/application/application_viewmodel.dart';

class PageViewOfApp extends StatelessWidget {
  final ApplicationViewModel _viewModel;
  const PageViewOfApp({
    super.key,
    required ApplicationViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _viewModel.pageController,
      children: _viewModel.pageList,
      onPageChanged: (index) {
        _viewModel.onPageChanged(index);
      },
    );
  }
}
