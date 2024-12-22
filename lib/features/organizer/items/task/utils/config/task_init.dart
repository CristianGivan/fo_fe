import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_items_from_logIn_user_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_reminder_link/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_user_link/update_task_user_link_usecase.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_user_link/update_user_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/update_task_dto_use_case.dart';
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

  // Task Reminder Use cases
  sl.registerLazySingleton(() => GetReminderItemsByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => UpdateReminderItemsOfTaskUseCase(sl()));

  // Task Tag Use cases
  sl.registerLazySingleton(() => GetTagItemsByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTagItemsOfTaskUseCase(sl()));

  // Task User Use cases
  sl.registerLazySingleton(() => GetCreatorByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => GetUserItemsByTaskIdUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTaskUserLinkUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserItemsOfTaskUseCase(sl()));

  // Task Use cases
  sl.registerLazySingleton(() => GetTaskByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetTaskItemsAllUseCase(sl()));
  sl.registerLazySingleton(() => GetTaskItemsFromLogInUserUseCase(sl(), sl()));
  sl.registerLazySingleton(() => GetTaskItemsByIdSetUseCase(sl()));
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTaskUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTaskDtoUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTaskUseCase(sl()));
  sl.registerLazySingleton(() => TaskFilterUseCase());
  sl.registerLazySingleton(() => TaskSortUseCase());

  // Task BLoCs
  sl.registerFactory(() => TaskBloc(
        getTaskById: sl(),
        getTaskItemsAll: sl(),
        getTaskItemsFromLogInUser: sl(),
        getTaskItemsByIdSet: sl(),
        addTask: sl(),
        deleteTask: sl(),
        sortTasksUseCase: sl(),
        filterTasksUseCase: sl(),
        updateTaskDto: sl(),
        updateTask: sl(),
      ));
  sl.registerFactory(() => TaskFormCubit());
  sl.registerFactory(() => TaskUserLinkBloc(
        getUserItemsByTaskId: sl(),
        getCreatorByTaskId: sl(),
        updateUserItemsOfTask: sl(),
        updateTaskUserLink: sl(),
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
