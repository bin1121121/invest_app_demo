import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/models/login_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_field.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class LoginTextFieldPassword extends StatelessWidget {
  const LoginTextFieldPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    return CustomTextField(
      hintText: AppLanguages.password,
      controller: viewModel.passwordTextEditingController,
      onChanged: (value) => viewModel.setPassword(value),
      validator: (value) => viewModel.validPassword(value),
      isPasswordVisible: viewModel.isPasswordVisible,
      onPressedChangeVisibility: () => viewModel.changePasswordVisibility(),
    );
  }
}
