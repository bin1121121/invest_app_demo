import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/helper/provider_setup.dart';
import 'package:invest_app_flutter_test/helper/routers.dart';
import 'package:invest_app_flutter_test/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers.generateRoute,
        initialRoute: Routers.splash,
        theme: AppTheme().getApplicationTheme(),
      ),
    );
  }
}
