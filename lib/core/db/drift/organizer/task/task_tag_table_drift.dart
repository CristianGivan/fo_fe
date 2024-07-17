import 'package:drift/drift.dart';

@DataClassName('TaskTagTableDriftG')
class TaskTagTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get linkingDate =>
      dateTime().withDefault(currentDateAndTime)();

  IntColumn get taskId =>
      integer().customConstraint('REFERENCES TaskTableDrift(id)')();

  IntColumn get tagId =>
      integer().customConstraint('REFERENCES TagTableDrift(id)')();
}
