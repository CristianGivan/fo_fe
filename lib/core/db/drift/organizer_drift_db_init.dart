import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void driftDbInit() {
  final organizerDb = OrganizerDriftDB();
  sl.registerSingleton<OrganizerDriftDB>(organizerDb);
  sl.registerSingleton<TaskDaoDrift>(TaskDaoDrift(organizerDb));
  sl.registerSingleton<UserDaoDrift>(UserDaoDrift(organizerDb));
  sl.registerSingleton<UserUserDaoDrift>(UserUserDaoDrift(organizerDb));
  sl.registerSingleton<TagDaoDrift>(TagDaoDrift(organizerDb));
  sl.registerSingleton<ReminderDaoDrift>(ReminderDaoDrift(organizerDb));
  sl.registerSingleton<TaskUserDaoDrift>(TaskUserDaoDrift(organizerDb));
  sl.registerSingleton<TaskTagDaoDrift>(TaskTagDaoDrift(organizerDb));
  sl.registerSingleton<TaskReminderDaoDrift>(TaskReminderDaoDrift(organizerDb));

  final authenticationDb = AuthenticationDriftDB();
  sl.registerSingleton<AuthenticationDriftDB>(authenticationDb);
}
