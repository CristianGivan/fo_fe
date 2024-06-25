import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_db.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/note_table_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/reminder_table_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/tag_table_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/user_table_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/datasourece/task_table_drift.dart';

import '../../../features/organizer/items/organizer_item/data/drift/organizer_item_table_drift.dart';
import '../../../features/organizer/items/task/data/drift/datasourece/task_dao_drift.dart';
import 'connection/db_dev.dart' as db_dev;

part 'organizer_drift_db.g.dart';

@DriftDatabase(tables: [
  OrganizerItemTableDrift,
  UserTableDrift,
  TagTableDrift,
  ReminderTableDrift,
  TaskTableDrift,
  NoteTableDrift,
], daos: [
  TaskDaoDrift,
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
