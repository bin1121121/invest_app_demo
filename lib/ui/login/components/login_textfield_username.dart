import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class LoginTextFieldUserName extends StatelessWidget {
  final LoginViewModel _viewModel;

  const LoginTextFieldUserName({
    super.key,
    required LoginViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _viewModel.userNameTextEditingController,
      decoration: const InputDecoration(
        labelText: AppLanguages.userName,
      ),
      onChanged: (value) => _viewModel.setUserName(value),
      validator: (value) => _viewModel.validUserName(value),
    );
  }
}
