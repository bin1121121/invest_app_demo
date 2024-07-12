import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/resource/asset_img.dart';
import 'package:invest_app_flutter_test/ui/page/splash/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashViewmodel _splashViewmodel = SplashViewmodel();
  @override
  void initState() {
    super.initState();
    setTimeOut();
  }

  void setTimeOut() {
    Future.delayed(const Duration(seconds: 3), () async {
      await _splashViewmodel.onNextPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Image.asset(AssetImg.img_logo_group),
        ),
      ),
    );
  }
}
