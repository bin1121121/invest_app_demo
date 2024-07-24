import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/ui/page/notification/components/notification_card_widget.dart';
import 'package:invest_app_flutter_test/ui/page/notification/notification_viewmodel.dart';

class NotificationListViewWidget extends StatelessWidget {
  final NotificationViewModel _viewModel;
  const NotificationListViewWidget({
    super.key,
    required NotificationViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _viewModel.loadingSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: _viewModel.notifications.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              NotificationLocalData notification =
                  _viewModel.notifications[index];
              return NotificationCardWidget(
                thumbnail: notification.thumbnail,
                description: notification.description,
                createdAt: notification.createdAt,
                onDelete: () =>
                    _viewModel.deleteNotificationById(notification.id),
              );
            },
          );
        });
  }
}
