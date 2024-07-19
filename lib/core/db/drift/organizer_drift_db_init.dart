import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initOrganizerDriftDb() {
  final db = OrganizerDriftDB();
  sl.registerSingleton<OrganizerDriftDB>(db);
  sl.registerSingleton<TaskDaoDrift>(TaskDaoDrift(db));
  sl.registerSingleton<UserDaoDrift>(UserDaoDrift(db));
  sl.registerSingleton<UserUserDaoDrift>(UserUserDaoDrift(db));
  sl.registerSingleton<TagDaoDrift>(TagDaoDrift(db));
  sl.registerSingleton<ReminderDaoDrift>(ReminderDaoDrift(db));
  sl.registerSingleton<TaskUserDaoDrift>(TaskUserDaoDrift(db));
  sl.registerSingleton<TaskTagDaoDrift>(TaskTagDaoDrift(db));
  sl.registerSingleton<TaskReminderDaoDrift>(TaskReminderDaoDrift(db));
}
