import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void driftDbInit() {
  final organizerDb = OrganizerDriftDB();
  sl.registerSingleton<OrganizerDriftDB>(organizerDb);

  final authenticationDb = AuthenticationDriftDB();
  sl.registerSingleton<AuthenticationDriftDB>(authenticationDb);
}
