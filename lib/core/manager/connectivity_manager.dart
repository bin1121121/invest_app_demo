import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityManager {
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
}
