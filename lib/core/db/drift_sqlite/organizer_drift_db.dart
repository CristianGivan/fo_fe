import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fo_fe/core/db/drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/datasourece/task_table_drift.dart';
import 'package:path/path.dart' as p;

import '../../../features/organizer/items/task/data/drift/datasourece/task_dao_drift.dart';

part 'organizer_drift_db.g.dart';

@DriftDatabase(tables: [TaskTableDrift], daos: [TaskDaoDrift])
class DriftDBOrganizer extends _$DriftDBOrganizer implements DriftDB {
  DriftDBOrganizer() : super(_openConnection());

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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    String projectDir = Directory.current.path;
    final dbFolderPath = p.join(projectDir, 'lib', 'core', 'db', 'test_db');
    await Directory(dbFolderPath).create(recursive: true);
    final file = File(p.join(dbFolderPath, 'driftDBOrganizer.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
