import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/account/components/account_view.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/core/models/account_viewmodel.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AccountViewModel>(
      viewModel: AccountViewModel(),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return const AccountView();
      },
    );
  }
}
