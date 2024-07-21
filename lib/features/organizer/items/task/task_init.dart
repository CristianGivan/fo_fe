import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void taskInit() {
  // Task BLoCs
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

  // Task Use cases
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

  // Task Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryDrift(
        localDataSource: sl<TaskLocalDataSourceDrift>(),
      ));

  // Task Data Sources
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
}
