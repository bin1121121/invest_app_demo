import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/ui/account/components/account_view.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/account/account_viewmodel.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AccountViewModel>(
      viewModel: AccountViewModel(
          authRepository: Provider.of<AuthRepository>(context, listen: false)),
      builder: (context, viewModel, child) {
        return AccountView();
      },
    );
  }
}
