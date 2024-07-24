import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/components/create_account_view.dart';
import 'package:invest_app_flutter_test/ui/page/create_account/create_account_viewmodel.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CreateAccountViewModel>(
      viewModel: CreateAccountViewModel(),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CreateAccountView(
              viewModel: viewModel,
            ),
          ),
        );
      },
    );
  }
}
