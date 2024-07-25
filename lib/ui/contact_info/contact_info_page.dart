import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/contact_info/components/contact_info_view.dart';
import 'package:invest_app_flutter_test/core/models/contact_info_viewmodel.dart';

class ContactInfoPage extends StatelessWidget {
  const ContactInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContactInfoViewModel>(
      onViewModelReady: (viewModel) => viewModel.onInit(),
      viewModel: ContactInfoViewModel(),
      builder: (context, viewModel, child) {
        return const ContactInfoView();
      },
    );
  }
}
