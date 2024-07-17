import 'package:drift/drift.dart';

@DataClassName('TaskReminderTableDriftG')
class TaskReminderTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get linkingDate =>
      dateTime().withDefault(currentDateAndTime)();

  IntColumn get taskId =>
      integer().customConstraint('REFERENCES TaskTableDrift(id)')();

  IntColumn get reminderId =>
      integer().customConstraint('REFERENCES ReminderTableDrift(id)')();
}
