import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:fo_fe/core/db/drift/connection/db_connection_drift.dart';
import 'package:fo_fe/core/db/drift/organizer/tag/tag_user_link/tag_user_link_dao_drift.dart';
import 'package:fo_fe/core/db/drift/organizer/tag/tag_user_link/tag_user_link_table_drift.dart';

import 'organizer_drift_exports.dart';

part 'organizer_drift_db.g.dart';

@DriftDatabase(tables: [
  OrganizerItemTableDrift,
  TaskTableDrift,
  TaskTagLinkTableDrift,
  TaskReminderLinkTableDrift,
  TaskUserLinkTableDrift,
  UserTableDrift,
  UserUserTableDrift,
  ReminderTableDrift,
  TagTableDrift,
  TagUserLinkTableDrift,
], daos: [
  OrganizerItemDaoDrift,
  TaskDaoDrift,
  TaskTagLinkDaoDrift,
  TaskReminderLinkDaoDrift,
  TaskUserLinkDaoDrift,
  UserDaoDrift,
  UserUserDaoDrift,
  ReminderDaoDrift,
  TagDaoDrift,
  TagUserLinkDaoDrift,
])
class OrganizerDriftDB extends _$OrganizerDriftDB {
  OrganizerDriftDB({bool isDev = false, bool inMemory = false})
      : super(_openConnection(isDev: isDev, inMemory: inMemory));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) async {
        await m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2 && to >= 3) {
          await m.createTable(userTableDrift);
          await m.createTable(userUserTableDrift);
        }
      });

  static LazyDatabase _openConnection({bool isDev = false, bool inMemory = false}) {
    return LazyDatabase(() async {
      if (inMemory) {
        // Use in-memory database for tests
        return NativeDatabase.memory();
      } else {
        // Otherwise, use file-based SQLite for production
        final connection = await connect(
          'OrganizerDBDrift.sqlite',
          logStatements: kDebugMode,
          isDev: isDev,
        );
        return connection.executor;
      }
    });
  }
}
