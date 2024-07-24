import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/account/account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_fonts.dart';

class AccountUserNameWidget extends StatelessWidget {
  final AccountViewModel _viewModel;
  const AccountUserNameWidget({
    super.key,
    required AccountViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: _viewModel.userStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data ?? "",
            style: customContentTextStyle(
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.SF_Compact_Display,
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
