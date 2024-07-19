import 'package:fo_fe/features/organizer/items/reminder/domain/usecases/reminder_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';
import 'package:get_it/get_it.dart';

void initReminder() {
  final sl = GetIt.instance;

  // Data sources
  sl.registerLazySingleton<ReminderLocalDataSource>(
      () => ReminderLocalDataSourceDrift(reminderDaoDrift: sl()));

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
