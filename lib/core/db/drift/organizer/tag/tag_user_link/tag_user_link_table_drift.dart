import 'package:drift/drift.dart';

@DataClassName('TagUserLinkTableDriftG')
class TagUserLinkTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get linkingDate => dateTime().withDefault(currentDateAndTime)();

  IntColumn get tagId => integer().customConstraint('REFERENCES TagTableDrift(id)')();

  IntColumn get userId => integer().customConstraint('REFERENCES UserTableDrift(id)')();

  BoolColumn get selectedByUser => boolean().nullable()();

  IntColumn get orderedByUser => integer().nullable()();
}
