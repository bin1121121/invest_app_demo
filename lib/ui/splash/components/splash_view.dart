import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.img_logo_group,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
