import 'package:drift/drift.dart';

@DataClassName('OrganizerItemTableDriftG')
class OrganizerItemTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get subject => text().withLength(min: 1, max: 255)();

  DateTimeColumn get createdDate => dateTime()();

  TextColumn get creator => text().withLength(min: 1, max: 255)();

  TextColumn get userList => text()(); // Storing as JSON string
  TextColumn get tagList => text()(); // Storing as JSON string
  TextColumn get reminderList => text()(); // Storing as JSON string
  IntColumn get remoteId => integer()();

  DateTimeColumn get lastUpdate => dateTime().nullable()();

  DateTimeColumn get lastViewDate => dateTime().nullable()();

  IntColumn get remoteViews => integer().nullable()();

  IntColumn get views => integer().nullable()();

  TextColumn get checksum => text().nullable()();
}
