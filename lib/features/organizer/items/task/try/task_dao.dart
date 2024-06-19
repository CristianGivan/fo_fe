import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/task/try/task_entities.dart';

import '../../../../../core/db/drift_sqlite/organizer_drift_db.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<OrganizerDriftDB> with _$TaskDaoMixin {
  TaskDao(OrganizerDriftDB db) : super(db);

  Future<int> insertTask(TaskTableCompanion task) =>
      into(taskTable).insert(task);

  Future<List<TaskTableData>> getAllTasks() => select(taskTable).get();
// Add other methods for update, delete, etc.
}
