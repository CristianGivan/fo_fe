import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/export_task_to_excel_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_crud_use_case/get_task_items_from_logIn_user_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_crud_use_case/update_task_dto_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/update_task_links_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_cubit/task_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
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

  // Task Link Use Cases

  sl.registerLazySingleton(() => GetTaskLinksUseCase<UserEntity>(sl()));
  sl.registerLazySingleton(() => GetTaskLinksUseCase<TagEntity>(sl()));
  sl.registerLazySingleton(() => UpdateTaskLinkUseCase<UserEntity>(sl()));
  sl.registerLazySingleton(() => UpdateTaskLinkUseCase<TagEntity>(sl()));

  // Task Use cases
  sl.registerLazySingleton(() => GetTaskItemsFromLogInUserUseCase(sl()));
  sl.registerLazySingleton(() => AddTaskUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTaskDtoUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTaskItemsUseCase(sl()));
  sl.registerLazySingleton(() => TaskFilterUseCase());
  sl.registerLazySingleton(() => TaskSortUseCase());

  // Task Bloc
  sl.registerLazySingleton<TaskBloc>(() => TaskBloc(
        exportTaskToExcelUseCase: sl(),
        filterTasksUseCase: sl(),
        sortTasksUseCase: sl(),
        updateTaskDtoUseCase: sl(),
      ));

  sl.registerFactory(() => TaskFormCubit());

  sl.registerFactory(() => TaskUserLinksBloc());

  // Task Export Service
  sl.registerLazySingleton(() => ExportTaskToExcelUseCase(sl()));
}
