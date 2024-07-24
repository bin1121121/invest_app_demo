import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class LoginTextFieldPassword extends StatelessWidget {
  const LoginTextFieldPassword({
    super.key,
    required LoginViewModel viewModel,
  }) : _viewModel = viewModel;

  final LoginViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _viewModel.isPasswordVisible,
      controller: _viewModel.passwordTextEditingController,
      decoration: InputDecoration(
        labelText: AppLanguages.password,
        suffixIcon: IconButton(
          onPressed: () {
            _viewModel.changePasswordVisibility();
          },
          icon: Icon(
            _viewModel.isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColors.green,
          ),
        ),
      ),
      onChanged: (value) => _viewModel.setPassword(value),
      validator: (value) => _viewModel.validPassword(value),
    );
  }
}
