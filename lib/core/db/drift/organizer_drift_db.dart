import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer/task/task_reminder_dao_drift.dart';
import 'package:fo_fe/core/db/drift/organizer/task/task_reminder_table_drift.dart';
import 'package:fo_fe/core/db/drift/organizer/user/user_user_dao_drift.dart';
import 'package:fo_fe/core/db/drift/organizer/user/user_user_table_drift.dart';
import 'package:fo_fe/core/db/drift_db.dart';

import 'connection/db_dev.dart' as db_dev;
import 'organizer_drift_exports.dart';

part 'organizer_drift_db.g.dart';

@DriftDatabase(tables: [
  OrganizerItemTableDrift,
  TaskTableDrift,
  TaskTagTableDrift,
  TaskReminderTableDrift,
  TaskUserTableDrift,
  UserTableDrift,
  UserUserTableDrift,
  ReminderTableDrift,
  TagTableDrift,
], daos: [
  OrganizerItemDaoDrift,
  TaskDaoDrift,
  TaskTagDaoDrift,
  TaskReminderDaoDrift,
  TaskUserDaoDrift,
  UserDaoDrift,
  UserUserDaoDrift,
  ReminderDaoDrift,
  TagDaoDrift,
])
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
