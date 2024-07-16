import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_string.dart';

class ButtonCreate extends StatelessWidget {
  const ButtonCreate({
    super.key,
    required CreateAccountViewModel createAccountViewmodel,
    required GlobalKey<FormState> formKey,
  })  : _createAccountViewmodel = createAccountViewmodel,
        _formKey = formKey;

  final CreateAccountViewModel _createAccountViewmodel;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _createAccountViewmodel.isAllInputsValidStream,
      builder: (context, snapshot) {
        return SizedBox(
          height: 60.w,
          width: MediaQuery.of(context).size.width,
          child: customButtom(
            backgroundColor:
                snapshot.data == true ? AppColors.green : AppColors.grey2,
            onPressed: snapshot.data == true
                ? () {
                    if (_formKey.currentState!.validate()) {
                      _createAccountViewmodel.onRegister(context);
                    }
                  }
                : () {},
            child: Text(
              AppString.createAccount,
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
