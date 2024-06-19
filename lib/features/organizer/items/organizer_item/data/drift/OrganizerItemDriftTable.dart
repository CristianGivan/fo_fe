import 'package:drift/drift.dart';

@DataClassName('OrganizerItemDriftTableGen')
class OrganizerItemDriftTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get subject => text()();

  DateTimeColumn get createdDate => dateTime()();

  // IntColumn get creatorId =>
  //     integer().customConstraint('REFERENCES users(id)')();
  //
  // IntColumn get remoteId => integer().nullable()();
  //
  // DateTimeColumn? get lastUpdate => dateTime().nullable()();
  //
  // DateTimeColumn? get lastViewDate => dateTime().nullable()();
  //
  // IntColumn? get remoteViews => integer().nullable()();
  //
  // IntColumn? get views => integer().nullable()();
  //
  // TextColumn? get checksum => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
