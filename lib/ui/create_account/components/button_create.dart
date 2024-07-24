import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';

class ButtonCreate extends StatelessWidget {
  const ButtonCreate({
    super.key,
    required CreateAccountViewModel viewModel,
    required GlobalKey<FormState> formKey,
  })  : _viewModel = viewModel,
        _formKey = formKey;

  final CreateAccountViewModel _viewModel;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _viewModel.isAllInputsValidStream,
      builder: (context, snapshot) {
        return SizedBox(
          height: 60.w,
          width: MediaQuery.of(context).size.width,
          child: customButton(
            backgroundColor:
                snapshot.data == true ? AppColors.green : AppColors.grey2,
            onPressed: snapshot.data == true
                ? () {
                    if (_formKey.currentState!.validate()) {
                      _viewModel.onRegister();
                    }
                  }
                : () {},
            child: Text(
              AppLanguages.createAccount,
              style: customContentTextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
