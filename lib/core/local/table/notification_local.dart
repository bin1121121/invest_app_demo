import 'package:drift/drift.dart';

class NotificationLocal extends Table {
  TextColumn get id => text()();
  TextColumn get thumbnail => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
}
