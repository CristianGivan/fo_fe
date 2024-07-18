import 'package:drift/drift.dart';

@DataClassName('OrganizerItemTableDriftG')
class OrganizerItemTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get createdDate =>
      dateTime().withDefault(currentDateAndTime)();

  IntColumn get creatorId => integer()();

  IntColumn get remoteId => integer().nullable()();

  DateTimeColumn get lastUpdate => dateTime().nullable()();

  DateTimeColumn get lastAccessedDate => dateTime().nullable()();

  IntColumn get remoteAccesses => integer().nullable()();

  IntColumn get accesses => integer().nullable()();

  TextColumn get checksum => text().nullable()();
}
