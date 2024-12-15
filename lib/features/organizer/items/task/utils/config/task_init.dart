import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_itemsFromLogInUser_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/update_user_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_cubit/task_form_cubit.dart';
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
  sl.registerLazySingleton(() => GetTaskByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetTaskItemsAllUseCase(sl()));
  sl.registerLazySingleton(() => GetTaskItemsFromLogInUserUseCase(sl()));
  sl.registerLazySingleton(() => GetTaskItemsByIdSetUseCase(sl()));
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTaskUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTaskUseCase(sl()));
  sl.registerLazySingleton(() => GetUserItemsByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => GetCreatorByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserItemsOfTaskUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTagItemsOfTaskUseCase(sl()));
  sl.registerLazySingleton(() => UpdateReminderItemsOfTaskUseCase(sl()));
  sl.registerLazySingleton(() => GetTagItemsByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => GetReminderItemsByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => TaskFilterUseCase());
  sl.registerLazySingleton(() => TaskSortUseCase());

  // Task BLoCs
  sl.registerFactory(() => TaskBloc(
        getTaskById: sl(),
        getTaskItemsAll: sl(),
        getTaskItemsFromLogInUser: sl(),
        getTaskItemsByIdSet: sl(),
        addTask: sl(),
        updateTask: sl(),
        deleteTask: sl(),
        sortTasksUseCase: sl(),
        filterTasksUseCase: sl(),
      ));
  sl.registerFactory(() => TaskFormCubit());
  sl.registerFactory(() => TaskUserLinkBloc(
        getUserItemsByTaskId: sl(),
        getCreatorByTaskId: sl(),
        updateUserItemsOfTask: sl(),
      ));
  sl.registerFactory(() => TaskTagLinkBloc(
        getTagsByTaskId: sl(),
        updateTagItemsOfTask: sl(),
      ));
  sl.registerFactory(() => TaskReminderLinkBloc(
        getRemindersByTaskId: sl(),
        updateReminderItemsOfTask: sl(),
      ));
}
