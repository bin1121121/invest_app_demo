import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/home/components/home_view.dart';
import 'package:invest_app_flutter_test/ui/home/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onViewModelReady: (value) => value.onInit(),
      builder: (context, viewModel, child) {
        return HomeView(
          viewModel: viewModel,
        );
      },
    );
  }
}
