import 'package:drift/drift.dart';

@DataClassName('TaskUserTableDriftG')
class TaskUserTableDrift extends Table {
  IntColumn get taskId =>
      integer().customConstraint('REFERENCES TaskTableDrift(id)')();

  IntColumn get userId =>
      integer().customConstraint('REFERENCES UserTableDrift(id)')();
}
