import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/datasourece/tables/task_table_drift.dart';
import 'package:fo_fe/features/organizer/items/task/try/task_dao.dart';

import '../../../features/organizer/items/task/data/drift/datasourece/task_dao_drift.dart';
import '../../../features/organizer/items/task/try/task_entities.dart';
import 'connection/db_dev.dart' as db_dev;

part 'organizer_drift_db.g.dart';

@DriftDatabase(
    tables: [TaskTableDrift, TaskTable], daos: [TaskDaoDrift, TaskDao])
class OrganizerDriftDB extends _$OrganizerDriftDB implements DriftDB {
  OrganizerDriftDB() : super(db_dev.connect());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {},
      );
}
