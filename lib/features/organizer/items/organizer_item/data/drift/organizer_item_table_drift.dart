import 'package:drift/drift.dart';

@DataClassName('OrganizerItemTableDriftG')
class OrganizerItemTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get subject => text().withLength(min: 1, max: 255)();

  DateTimeColumn get createdDate => dateTime()();

  IntColumn get creatorID =>
      integer().customConstraint('REFERENCES User(id)')();

  IntColumn get remoteId => integer().nullable()();

  DateTimeColumn get lastUpdate => dateTime().nullable()();

  DateTimeColumn get lastViewDate => dateTime().nullable()();

  IntColumn get remoteViews => integer().nullable()();

  IntColumn get views => integer().nullable()();

  TextColumn get checksum => text().nullable()();
}
