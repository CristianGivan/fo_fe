import 'package:drift/drift.dart';

@DataClassName('TaskUserTableDriftG')
class TaskUserTableDrift extends Table {
  IntColumn get taskUserId => integer().autoIncrement()();

  IntColumn get taskItemId =>
      integer().customConstraint('REFERENCES TaskTableDriftG(taskID)')();

  IntColumn get userId =>
      integer().customConstraint('REFERENCES UserTableDriftG(userID)')();
}
