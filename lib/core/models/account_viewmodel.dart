import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/core/helper/route_name.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/utils/app_function.dart';
import 'package:invest_app_flutter_test/utils/app_shared.dart';
import 'package:provider/provider.dart';

class AccountViewModel extends BaseViewModel {
  late final AuthRepository _authRepository;
  late final Stream<String?> _userStream;
  late final Stream<String?> _avatarStream;

  void onInit() {
    _authRepository = Provider.of<AuthRepository>(context, listen: false);
    _userStream = AppShared().watchName();
    _avatarStream = AppShared().watchAvatar();
  }

  void onLogOut() {
    AppFunction().logOut(context);
  }

  void onNavigateToContactInfoPage() {
    Navigator.of(context).pushNamed(RouteName.contactInfoPage);
  }

  Future getCurrentAuthUser() async {
    await _authRepository.getCurrentAuthUser().then((authResponse) {
      print("Response: ${authResponse.data}");
    }).catchError((error) {
      print("Error: ${error.toString()}");
    });
  }

  Stream<String?> get avatarStream => _avatarStream;
  Stream<String?> get userStream => _userStream;
}
