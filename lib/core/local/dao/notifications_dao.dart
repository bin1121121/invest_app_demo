import 'dart:async';

import 'package:drift/drift.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';

part 'notifications_dao.g.dart';

@DriftAccessor(tables: [NotificationLocal])
class NotificationLocalDao extends DatabaseAccessor<AppDatabase>
    with _$NotificationLocalDaoMixin {
  NotificationLocalDao(AppDatabase db) : super(db);

  Future<void> insertAllNotifications(
      List<NotificationLocalData> notifications) async {
    await batch(
      (batch) {
        batch.insertAll(db.notificationLocal, notifications);
      },
    );
  }

  Future<List<NotificationLocalData>> getAllNotifications() async {
    return await select(db.notificationLocal).get();
  }

  Future deleteAllNotifications() async {
    await delete(db.notificationLocal).go();
  }

  Future deleteNotificationById(String id) async {
    await (delete(db.notificationLocal)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}