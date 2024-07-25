import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/splash/components/splash_view.dart';
import 'package:invest_app_flutter_test/core/models/splash_viewmodel.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
      viewModel: SplashViewModel(),
      onViewModelReady: (viewModel) => viewModel.onNextPage(),
      builder: (context, viewModel, child) {
        return const SplashView();
      },
    );
  }
}
