import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/page/splash/splash_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
      viewModel: SplashViewModel(),
      builder: (context, viewModel, child) {
        viewModel.onNextPage(context);
        return Scaffold(
          body: Center(
            child: Image.asset(
              AppAssets.img_logo_group,
              width: 200,
              height: 200,
            ),
          ),
        );
      },
    );
  }
}
