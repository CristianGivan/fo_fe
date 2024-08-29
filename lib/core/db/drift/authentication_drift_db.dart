import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fo_fe/core/db/drift_db.dart';

import 'connection/db_connection1.dart';
import 'organizer_drift_exports.dart';

part 'authentication_drift_db.g.dart';

@DriftDatabase(tables: [
  AuthenticationTableDrift,
], daos: [
  AuthenticationDaoDrift,
])
class AuthenticationDriftDB extends _$AuthenticationDriftDB implements DriftDB {
  AuthenticationDriftDB()
      : super(connect(
          'AuthenticationDBDrift.sqlite',
          logStatements: kDebugMode,
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
