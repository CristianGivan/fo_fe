import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fo_fe/core/db/drift/connection/db_connection_drift.dart';
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
  OrganizerDriftDB({bool isDev = false}) : super(_openConnection(isDev: isDev));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {},
      );

  static LazyDatabase _openConnection({bool isDev = false}) {
    return LazyDatabase(() async {
      final connection = await connect(
        'OrganizerDBDrift.sqlite',
        logStatements: kDebugMode,
        isDev: isDev,
      );
      return connection.executor;
    });
  }
}
