import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/add_tag_items_to_task.dart';
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
  sl.registerLazySingleton(() => AddTagToTask(sl()));
  sl.registerLazySingleton(() => AddTagItemsToTask(sl()));
  sl.registerLazySingleton(() => UpdateTagItemsOfTask(sl()));
  sl.registerLazySingleton(() => DeleteTagFromTask(sl()));
  sl.registerLazySingleton(() => GetTagItemsByTaskId(sl()));
  sl.registerLazySingleton(() => AddReminderToTask(sl()));
  sl.registerLazySingleton(() => DeleteReminderFromTask(sl()));
  sl.registerLazySingleton(() => GetRemindersByTaskId(sl()));
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
        addTagToTask: sl(),
        addTagItemsToTask: sl(),
        updateTagItemsOfTask: sl(),
        deleteTagFromTask: sl(),
      ));
  sl.registerFactory(() => TaskReminderLinkBloc(
        getRemindersByTaskId: sl(),
        addReminderToTask: sl(),
        deleteReminderFromTask: sl(),
      ));
}
