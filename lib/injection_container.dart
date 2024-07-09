import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/db/drift/organizer/task/task_reminder_dao_drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_by_id.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'features/organizer/items/task/domain/repositories/task_repository.dart';
import 'features/organizer/items/task/domain/usecases/load_task_items_all.dart';

final sl = GetIt.instance; // service locator

void init() {
  initFeature();
  initCore();
  initExternals();
  initDb();
}

void initFeature() {
  // Bloc
  sl.registerFactory(() => TaskBloc(
        loadTaskItemsAll: sl(),
        loadTaskItemsByIdSet: sl(),
        addTask: sl(),
        updateTask: sl(),
        deleteTask: sl(),
        addUserToTask: sl(),
        addTagToTask: sl(),
        addReminderToTask: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetTaskById(sl()));
  sl.registerLazySingleton(() => LoadTaskItemsAll(sl()));

  // Repositories
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryDrift(
        localDataSource: sl(),
      ));

  // Data Source
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl(
        httpClient: sl(),
      ));

  sl.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSourceDrift(
        taskDao: sl(),
        userDao: sl(),
        tagDao: sl(),
        reminderDao: sl(),
        taskUserDao: sl(),
        taskTagDao: sl(),
        taskReminderDao: sl(),
      ));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
}

void initCore() {
  // Util
  sl.registerLazySingleton(() => InputConverter());
}

void initExternals() {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}

void initDb() {
  final db = OrganizerDriftDB();
  sl.registerSingleton<OrganizerDriftDB>(db);
  sl.registerSingleton<TaskDaoDrift>(TaskDaoDrift(db));
  sl.registerSingleton<UserDaoDrift>(UserDaoDrift(db));
  sl.registerSingleton<TagDaoDrift>(TagDaoDrift(db));
  sl.registerSingleton<ReminderDaoDrift>(ReminderDaoDrift(db));
  sl.registerSingleton<TaskUserDaoDrift>(TaskUserDaoDrift(db));
  sl.registerSingleton<TaskTagDaoDrift>(TaskTagDaoDrift(db));
  sl.registerSingleton<TaskReminderDaoDrift>(TaskReminderDaoDrift(db));
}
