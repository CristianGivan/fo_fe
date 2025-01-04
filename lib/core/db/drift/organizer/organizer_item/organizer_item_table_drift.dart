import 'package:drift/drift.dart';

@DataClassName('OrganizerItemTableDriftG')
class OrganizerItemTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get remoteId => integer().nullable()();

  IntColumn get creatorId => integer().nullable()();

  TextColumn get subject => text().nullable()();

  DateTimeColumn get createdDate => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get lastUpdate => dateTime().nullable()();

  DateTimeColumn get lastViewedDate => dateTime().nullable()();

  IntColumn get remoteViews => integer().nullable()();

  IntColumn get views => integer().nullable()();

  TextColumn get checksum => text().nullable()();
}
