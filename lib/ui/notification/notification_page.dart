import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/ui/base/base_widget.dart';
import 'package:invest_app_flutter_test/ui/notification/components/notification_view.dart';
import 'package:invest_app_flutter_test/ui/notification/notification_viewmodel.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NotificationViewModel>(
      viewModel: NotificationViewModel(
          appDatabase: Provider.of<AppDatabase>(context, listen: false)),
      onViewModelReady: (viewModel) async => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return const NotificationView();
      },
    );
  }
}
