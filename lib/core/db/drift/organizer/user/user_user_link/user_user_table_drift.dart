import 'package:drift/drift.dart';

@DataClassName('UserUserTableDriftG')
class UserUserTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().customConstraint('REFERENCES UserTableDrift(id)')();

  IntColumn get userIdLinked => integer().customConstraint('REFERENCES UserTableDrift(id)')();

  TextColumn get userNameLinked => text()();

  TextColumn get status => text()();

  DateTimeColumn get muteUntilDate => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdDate => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedDate => dateTime().withDefault(currentDateAndTime)();
}
