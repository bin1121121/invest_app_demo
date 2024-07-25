import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/models/account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/custom_text_style.dart';
import 'package:invest_app_flutter_test/utils/app_colors.dart';
import 'package:invest_app_flutter_test/utils/app_fonts.dart';
import 'package:provider/provider.dart';

class AccountUserNameWidget extends StatelessWidget {
  const AccountUserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AccountViewModel>();
    return StreamBuilder<String?>(
      stream: viewModel.userStream,
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
