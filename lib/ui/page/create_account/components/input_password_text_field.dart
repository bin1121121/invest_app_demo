import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';

class InPutPasswordTextField extends StatelessWidget {
  const InPutPasswordTextField({
    super.key,
    required this.passwordController,
    required this.createAccountViewmodel,
  });

  final TextEditingController passwordController;
  final CreateAccountViewModel createAccountViewmodel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: createAccountViewmodel.isPasswordVisible,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: AppString.password,
        suffixIcon: IconButton(
          onPressed: () {
            createAccountViewmodel.changePasswordVisibility();
          },
          icon: Icon(
            createAccountViewmodel.isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColors.green,
          ),
        ),
      ),
      validator: (value) => createAccountViewmodel.validPassword(value),
      onChanged: (value) {
        createAccountViewmodel.setPassword(value);
      },
    );
  }
}
