import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/core/remote/services/auth_services.dart';
import 'package:invest_app_flutter_test/core/remote/services/retrofit.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...dependentRepositories,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: AppShared()),
  Provider.value(value: AppDatabase()),
  Provider.value(value: Retrofit()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Retrofit, AuthServices>(
    update: (context, retrofit, _) => AuthServices(retrofit),
  ),
];

List<SingleChildWidget> dependentRepositories = [
  ProxyProvider<AuthServices, AuthRepository>(
    update: (context, authServices, _) => AuthRepository(
      authServices,
    ),
  ),
];
