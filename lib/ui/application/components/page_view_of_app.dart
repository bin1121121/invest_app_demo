import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/models/application_viewmodel.dart';
import 'package:provider/provider.dart';

class PageViewOfApp extends StatelessWidget {
  const PageViewOfApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplicationViewModel>();
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      children: viewModel.pageList,
      onPageChanged: (index) {
        viewModel.onPageChanged(index);
      },
    );
  }
}
