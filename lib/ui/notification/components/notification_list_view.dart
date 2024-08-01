import 'package:flutter/material.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/ui/notification/components/notification_card.dart';
import 'package:invest_app_flutter_test/ui/notification/notification_viewmodel.dart';

import 'package:provider/provider.dart';

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NotificationViewModel>();
    return StreamBuilder<List<NotificationLocalData>>(
        stream:
            viewModel.appDatabase.notificationLocalDao.watchAllNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return ListView.separated(
              itemCount: snapshot.data?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                NotificationLocalData notification = snapshot.data![index];
                return NotificationCard(
                  thumbnail: notification.thumbnail,
                  description: notification.description,
                  createdAt: notification.createdAt,
                  onDelete: () =>
                      viewModel.deleteNotificationById(notification.id),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
