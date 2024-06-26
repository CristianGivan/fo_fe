import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_db.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/DAOs/organizer_item_dao_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/DAOs/organizer_item_tag_dao_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/DAOs/organizer_item_user_dao_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/DAOs/reminder_dao_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/DAOs/tag_dao_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/DAOs/user_dao_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/tables/organizer_item_tag_table_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/tables/organizer_item_user_table_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/tables/reminder_table_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/tables/tag_table_drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/tables/user_table_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/datasourece/task_table_drift.dart';

import '../../../features/organizer/items/organizer_item/data/drift/tables/organizer_item_table_drift.dart';
import '../../../features/organizer/items/task/data/drift/datasourece/task_dao_drift.dart';
import 'connection/db_dev.dart' as db_dev;

part 'organizer_drift_db.g.dart';

@DriftDatabase(tables: [
  OrganizerItemTableDrift,
  OrganizerItemTagTableDrift,
  OrganizerItemUserTableDrift,
  ReminderTableDrift,
  TagTableDrift,
  TaskTableDrift,
  UserTableDrift,
], daos: [
  OrganizerItemDaoDrift,
  OrganizerItemTagDaoDrift,
  OrganizerItemUserDaoDrift,
  ReminderDaoDrift,
  TagDaoDrift,
  UserDaoDrift,
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
