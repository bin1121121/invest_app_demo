import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_view.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      onViewModelReady: (viewModel) => viewModel.onInit(),
      viewModel: LoginViewModel(),
      builder: (context, viewModel, child) {
        return LoginView(
          viewModel: viewModel,
        );
      },
    );
  }
}
