import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:invest_app_flutter_test/core/local/dao/notifications_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

class NotificationLocal extends Table {
  TextColumn get id => text()();
  TextColumn get thumbnail => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(tables: [NotificationLocal], daos: [NotificationLocalDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_onpenConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}

LazyDatabase _onpenConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'user.db'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file);
  });
}
