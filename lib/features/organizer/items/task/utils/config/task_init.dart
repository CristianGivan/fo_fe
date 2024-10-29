import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/add_reminder_items_to_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/add_tag_items_to_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void taskInit() {
  // Task Data Sources
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl(
        httpClient: sl(),
      ));
  sl.registerLazySingleton<TaskLocalDataSourceDrift>(() => TaskLocalDataSourceDrift(
        db: sl<OrganizerDriftDB>(),
      ));

  // Task Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryDrift(
        localDataSource: sl<TaskLocalDataSourceDrift>(),
      ));

  // Task Use cases
  sl.registerLazySingleton(() => GetTaskById(sl()));
  sl.registerLazySingleton(() => GetTaskItemsAll(sl()));
  sl.registerLazySingleton(() => GetTaskItemsByIdSet(sl()));
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => AddUserToTask(sl()));
  sl.registerLazySingleton(() => DeleteUserFromTask(sl()));
  sl.registerLazySingleton(() => GetUsersByTaskId(sl()));
  sl.registerLazySingleton(() => AddTagItemsToTaskUseCase(sl()));
  sl.registerLazySingleton(() => AddReminderItemsToTaskUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTagItemsOfTask(sl()));
  sl.registerLazySingleton(() => UpdateReminderItemsOfTask(sl()));
  sl.registerLazySingleton(() => DeleteTagFromTask(sl()));
  sl.registerLazySingleton(() => GetTagItemsByTaskId(sl()));
  sl.registerLazySingleton(() => DeleteReminderFromTask(sl()));
  sl.registerLazySingleton(() => GetReminderItemsByTaskId(sl()));
  sl.registerLazySingleton(() => TaskFilterUseCase());
  sl.registerLazySingleton(() => TaskSortUseCase());

  // Task BLoCs
  sl.registerFactory(() => TaskBlocTask(
        getTaskById: sl(),
        getTaskItemsAll: sl(),
        getTaskItemsByIdSet: sl(),
        addTask: sl(),
        updateTask: sl(),
        deleteTask: sl(),
        sortTasksUseCase: sl(),
        filterTasksUseCase: sl(),
      ));
  sl.registerFactory(() => TaskBlocUser(
        getUsersByTaskId: sl(),
        addUserToTask: sl(),
        deleteUserFromTask: sl(),
      ));
  sl.registerFactory(() => TaskTagLinkBloc(
        getTagsByTaskId: sl(),
        addReminderItemsToTask: sl(),
        updateTagItemsOfTask: sl(),
        deleteTagFromTask: sl(),
      ));
  sl.registerFactory(() => TaskReminderLinkBloc(
        getRemindersByTaskId: sl(),
        deleteReminderFromTask: sl(),
        addReminderItemsToTask: sl(),
        updateReminderItemsOfTask: sl(),
      ));
}
