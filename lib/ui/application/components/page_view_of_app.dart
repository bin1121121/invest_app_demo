import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/account/account_page.dart';
import 'package:invest_app_flutter_test/ui/application/application_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/home/home_page.dart';
import 'package:provider/provider.dart';

class PageViewOfApp extends StatelessWidget {
  const PageViewOfApp({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplicationViewModel>();
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      onPageChanged: viewModel.onPageChanged,
      children: const [
        HomePage(),
        Scaffold(
          body: Center(
            child: Text("Product"),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text("Transaction"),
          ),
        ),
        AccountPage(),
      ],
    );
  }
}
