import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/core/remote/services/app_services.dart';
import 'package:invest_app_flutter_test/core/routes/route.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:invest_app_flutter_test/utils/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AppShared>(
          create: (_) => AppShared(),
        ),
        Provider<AppDatabase>(
          create: (_) => AppDatabase(),
        ),
        Provider<AppServices>(
          create: (_) => AppServices(
            Dio(
              BaseOptions(
                headers: {
                  "Content-Type": "application/json",
                  "Accept": "application/json"
                },
              ),
            ),
          ),
        ),
      ],
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
        onGenerateRoute: generateRoute,
        initialRoute: RouteName.splashPage,
        theme: AppTheme().getApplicationTheme(),
      ),
    );
  }
}
