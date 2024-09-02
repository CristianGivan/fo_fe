import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_db.dart';

import 'connection/authentication_db_dev.dart' as authentication_db_dev;
import 'organizer_drift_exports.dart';

part 'authentication_drift_db.g.dart';

@DriftDatabase(tables: [
  AuthenticationTableDrift,
], daos: [
  AuthenticationDaoDrift,
])
class AuthenticationDriftDB extends _$AuthenticationDriftDB implements DriftDB {
  AuthenticationDriftDB() : super(authentication_db_dev.connect());

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
