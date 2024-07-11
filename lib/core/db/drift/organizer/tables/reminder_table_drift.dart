import 'package:drift/drift.dart';

@DataClassName('ReminderTableDriftG')
class ReminderTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get subject => text()();

  DateTimeColumn get remindAt => dateTime()();
}
