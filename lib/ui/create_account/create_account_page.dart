import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/core/repository/auth_repository.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/create_account/components/create_account_view.dart';
import 'package:invest_app_flutter_test/ui/create_account/create_account_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/widgets/icon_button_pre_page.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CreateAccountViewModel>(
      viewModel: CreateAccountViewModel(
        authRepository: Provider.of<AuthRepository>(context, listen: false),
      ),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: IconButtonPrePage()),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CreateAccountView(),
          ),
        );
      },
    );
  }
}
