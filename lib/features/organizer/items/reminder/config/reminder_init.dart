import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/usecases/reminder_usecase_export.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void reminderInt() {
  // Data sources
  sl.registerLazySingleton<ReminderLocalDataSource>(
      () => ReminderLocalDataSourceDrift(db: sl<OrganizerDriftDB>()));

  // Repository
  sl.registerLazySingleton<ReminderRepository>(
      () => ReminderRepositoryDrift(localDataSource: sl()));

  // Use cases
  sl.registerLazySingleton(() => InsertReminder(sl()));
  sl.registerLazySingleton(() => UpdateReminder(sl()));
  sl.registerLazySingleton(() => DeleteReminder(sl()));
  sl.registerLazySingleton(() => GetReminderById(sl()));
  sl.registerLazySingleton(() => GetReminderItemsAll(sl()));
  sl.registerLazySingleton(() => GetReminderItemsByIdSet(sl()));

  // Bloc
  sl.registerFactory(() => ReminderBlocReminder(
        insertReminder: sl(),
        updateReminder: sl(),
        deleteReminder: sl(),
        getReminderById: sl(),
        getReminderItemsAll: sl(),
        getReminderItemsByIdSet: sl(),
      ));
}
