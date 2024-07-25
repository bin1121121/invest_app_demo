import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/application/application_viewmodel.dart';
import 'package:invest_app_flutter_test/ui/application/components/bottom_nav_bar.dart';
import 'package:invest_app_flutter_test/ui/application/components/page_view_of_app.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ApplicationViewModel>(
      viewModel: ApplicationViewModel(),
      builder: (context, viewModel, child) {
        // ignore: prefer_const_constructors
        return Scaffold(
          bottomNavigationBar: BottomNavBar(),
          body: PageViewOfApp(),
        );
      },
    );
  }
}
