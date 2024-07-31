import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/helper/validation.dart';
import 'package:invest_app_flutter_test/ui/login/login_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_field.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class LoginTextFieldUserName extends StatelessWidget {
  const LoginTextFieldUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    return CustomTextField(
      hintText: AppLanguages.userName,
      controller: viewModel.userNameTextEditingController,
      onChanged: viewModel.setUserName,
      validator: ValidationHelper().isUserNameValidMessage,
    );
  }
}
