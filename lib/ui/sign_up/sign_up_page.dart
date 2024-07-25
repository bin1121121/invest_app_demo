import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/sign_up/components/sign_up_view.dart';
import 'package:invest_app_flutter_test/core/models/sign_up_viewmodel.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      builder: (context, viewModel, child) {
        return const SignUpView();
      },
    );
  }
}
