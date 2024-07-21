import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_db.dart';

import 'connection/organizer_db_dev.dart' as organizer_db_dev;
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
  OrganizerDriftDB() : super(organizer_db_dev.connect());

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
