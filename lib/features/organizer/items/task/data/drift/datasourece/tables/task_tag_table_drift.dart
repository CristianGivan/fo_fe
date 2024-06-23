import 'package:drift/drift.dart';

@DataClassName('TaskTagTableDriftG')
class TaskTagTableDrift extends Table {
  IntColumn get taskTagId => integer().autoIncrement()();

  IntColumn get taskId =>
      integer().customConstraint('REFERENCES TaskTableDriftG(noteID)')();

  IntColumn get userId =>
      integer().customConstraint('REFERENCES TagTableDriftG(userID)')();
}
