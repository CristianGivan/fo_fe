import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/connection/db_connection_drift_dev.dart'
    as dev_connection;
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
      : super(dev_connection.connect('AuthenticationDBDrift.sqlite',
            logStatements: true));

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
