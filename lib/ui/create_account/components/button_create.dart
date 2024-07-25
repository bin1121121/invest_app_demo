import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/models/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_button.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_languages.dart';
import 'package:provider/provider.dart';

class ButtonCreate extends StatelessWidget {
  const ButtonCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreateAccountViewModel>();
    return StreamBuilder<bool>(
      stream: viewModel.isAllInputsValidStream,
      builder: (context, snapshot) {
        return SizedBox(
          height: 60.w,
          width: MediaQuery.of(context).size.width,
          child: customButton(
            backgroundColor:
                snapshot.data == true ? AppColors.green : AppColors.grey2,
            onPressed: snapshot.data == true
                ? () {
                    viewModel.onValidForm();
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
