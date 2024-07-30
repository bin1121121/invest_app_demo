import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:invest_app_flutter_test/core/local/dao/notifications_dao.dart';

part 'app_database.g.dart';

class NotificationLocal extends Table {
  TextColumn get id => text()();
  TextColumn get thumbnail => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(
  tables: [NotificationLocal],
  daos: [NotificationLocalDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'invest.db');
  }
}
