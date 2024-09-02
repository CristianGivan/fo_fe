import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fo_fe/core/db/drift/connection/db_connection_drift.dart';
import 'package:fo_fe/core/db/drift_db.dart';

import 'organizer_drift_exports.dart';

part 'authentication_drift_db.g.dart';

@DriftDatabase(tables: [
  AuthenticationTableDrift,
], daos: [
  AuthenticationDaoDrift,
])
class AuthenticationDriftDB extends _$AuthenticationDriftDB implements DriftDB {
  AuthenticationDriftDB({bool isDev = false})
      : super(_openConnection(isDev: isDev));

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
        'AuthenticationDBDrift.sqlite',
        logStatements: kDebugMode,
        isDev: isDev,
      );
      return connection.executor;
    });
  }
}
