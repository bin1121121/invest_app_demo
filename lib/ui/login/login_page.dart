import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/login/components/login_view.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      viewModel: LoginViewModel(
        authRepository: Provider.of<AuthRepository>(context, listen: false),
      ),
      builder: (context, viewModel, child) {
        return LoginView();
      },
    );
  }
}
