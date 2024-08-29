import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/connection/db_connection_drift_dev.dart'
    as dev_connection;
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

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
class OrganizerDriftDB extends _$OrganizerDriftDB {
  OrganizerDriftDB({bool isDev = false})
      : super(dev_connection.connect(
          'OrganizerDBDrift.sqlite',
          logStatements: true,
        ));

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
