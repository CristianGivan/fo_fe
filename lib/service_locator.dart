import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/db/drift/organizer/task/task_reminder_dao_drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; // Service locator

void init() {
  initFeature();
  initCore();
  initExternals();
  initDb();
}

void initFeature() {
  // BLoCs
  sl.registerFactory(() => TaskBlocTask(
        getTaskById: sl(),
        getTaskItemsAll: sl(),
        getTaskItemsByIdSet: sl(),
        insertTask: sl(),
        updateTask: sl(),
        deleteTask: sl(),
      ));
  sl.registerFactory(() => TaskBlocUser(
        getUsersByTaskId: sl(),
        addUserToTask: sl(),
        deleteUserFromTask: sl(),
      ));
  sl.registerFactory(() => TaskBlocTag(
        getTagsByTaskId: sl(),
        addTagToTask: sl(),
        deleteTagFromTask: sl(),
      ));
  sl.registerFactory(() => TaskBlocReminder(
        getRemindersByTaskId: sl(),
        addReminderToTask: sl(),
        deleteReminderFromTask: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetTaskById(sl()));
  sl.registerLazySingleton(() => GetTaskItemsAll(sl()));
  sl.registerLazySingleton(() => GetTaskItemsByIdSet(sl()));
  sl.registerLazySingleton(() => InsertTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => AddUserToTask(sl()));
  sl.registerLazySingleton(() => DeleteUserFromTask(sl()));
  sl.registerLazySingleton(() => GetUsersByTaskId(sl()));
  sl.registerLazySingleton(() => AddTagToTask(sl()));
  sl.registerLazySingleton(() => DeleteTagFromTask(sl()));
  sl.registerLazySingleton(() => GetTagsByTaskId(sl()));
  sl.registerLazySingleton(() => AddReminderToTask(sl()));
  sl.registerLazySingleton(() => DeleteReminderFromTask(sl()));
  sl.registerLazySingleton(() => GetRemindersByTaskId(sl()));

  // Repositories
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryDrift(
        localDataSource: sl<TaskLocalDataSourceDrift>(),
      ));

  // Data Sources
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl(
        httpClient: sl(),
      ));
  sl.registerLazySingleton<TaskLocalDataSourceDrift>(
      () => TaskLocalDataSourceDrift(
            taskDao: sl(),
            userDao: sl(),
            tagDao: sl(),
            reminderDao: sl(),
            taskUserDao: sl(),
            taskTagDao: sl(),
            taskReminderDao: sl(),
          ));

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
}

void initCore() {
  // Util
  sl.registerLazySingleton(() => InputConverter());
}

void initExternals() {
  // External dependencies
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}

void initDb() {
  // Database and DAO registrations
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
