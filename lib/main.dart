import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/resource/theme_manager.dart';
import 'package:invest_app_flutter_test/core/routes/route.dart';
import 'package:invest_app_flutter_test/core/routes/route_name.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

late SharedPreferences sharedPreferences;
late RxSharedPreferences rxSharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  rxSharedPreferences = RxSharedPreferences(sharedPreferences);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 932),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<CreateAccountViewmodel>(
            create: (_) => CreateAccountViewmodel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateRoute,
          initialRoute: RouteName.splashPage,
          theme: getApplicationTheme(),
        ),
      ),
    );
  }
}
