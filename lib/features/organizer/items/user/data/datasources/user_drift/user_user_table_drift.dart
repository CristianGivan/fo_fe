import 'package:drift/drift.dart';

@DataClassName('UserUserTableDriftG')
class UserUserTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get linkingDate =>
      dateTime().withDefault(currentDateAndTime)();

  IntColumn get userId =>
      integer().customConstraint('REFERENCES UserTableDrift(id)')();

  IntColumn get userLinkedId =>
      integer().customConstraint('REFERENCES UserTableDrift(id)')();
}
