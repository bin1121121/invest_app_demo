import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/ui/notification/components/notification_card_widget.dart';
import 'package:invest_app_flutter_test/ui/notification/notification_viewmodel.dart';
import 'package:provider/provider.dart';

class NotificationListViewWidget extends StatelessWidget {
  const NotificationListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NotificationViewModel>();
    return StreamBuilder<bool>(
        stream: viewModel.loadingSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: viewModel.notifications.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              NotificationLocalData notification =
                  viewModel.notifications[index];
              return NotificationCardWidget(
                thumbnail: notification.thumbnail,
                description: notification.description,
                createdAt: notification.createdAt,
                onDelete: () =>
                    viewModel.deleteNotificationById(notification.id),
              );
            },
          );
        });
  }
}
