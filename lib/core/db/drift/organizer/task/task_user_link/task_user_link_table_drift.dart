import 'package:drift/drift.dart';

@DataClassName('TaskUserTableDriftG')
class TaskUserLinkTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get linkingDate =>
      dateTime().withDefault(currentDateAndTime)();

  IntColumn get taskId =>
      integer().customConstraint('REFERENCES TaskTableDrift(id)')();

  IntColumn get userId =>
      integer().customConstraint('REFERENCES UserTableDrift(id)')();
}
