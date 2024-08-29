import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fo_fe/core/db/drift/connection/lazy_database.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

// import 'connection/db_connection_drift.dart';
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
      : super(createLazyDatabase(
          dbName: 'OrganizerDBDrift.sqlite',
          logStatements: kDebugMode,
          isDev: isDev,
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
