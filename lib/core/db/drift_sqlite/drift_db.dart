import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../features/organizer/items/task/data/drift/datasourece/local_drift_sqlite/task_dao_drift.dart';
import '../../../features/organizer/items/task/data/drift/datasourece/local_drift_sqlite/task_table_drift.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [TaskTableDrift], daos: [TaskDaoDrift])
class DriftDB extends _$DriftDB {
  DriftDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
// Handle database upgrade
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(
        file); // Use NativeDatabase with background initialization
  });
}
