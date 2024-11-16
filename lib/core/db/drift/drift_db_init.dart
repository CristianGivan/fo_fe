import 'package:fo_fe/core/db/drift/auth_drift_db.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_db.dart'; // Ensure this import is correct
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void driftDbInit({bool isDev = false}) {
  final organizerDb = OrganizerDriftDB(isDev: isDev);
  sl.registerSingleton<OrganizerDriftDB>(organizerDb);

  final authDb = AuthDriftDB(isDev: isDev);
  sl.registerSingleton<AuthDriftDB>(authDb);
}
