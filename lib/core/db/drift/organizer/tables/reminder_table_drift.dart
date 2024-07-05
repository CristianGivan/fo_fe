import 'package:drift/drift.dart';

@DataClassName('ReminderTableDriftG')
class ReminderTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get remindAt => dateTime()();

  IntColumn get taskId =>
      integer().customConstraint('REFERENCES TaskTableDrift(id) NOT NULL')();
}
