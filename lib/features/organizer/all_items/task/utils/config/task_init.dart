import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/export_task_to_excel_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_reminder_link/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/update_items_of_item_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/update_task_user_link_usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/update_user_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/update_task_dto_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_bloc/task_items_link/item_link_items_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_cubit/task_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void taskInit() {
  final ItemsTypeEnum itemsType = ItemsTypeEnum.task;
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
  sl.registerLazySingleton(() => GetLinkItemsByItemIdUseCase<ItemEntity>(sl()));
  sl.registerLazySingleton(() => UpdateItemsOfItemUseCase<UserEntity>(sl()));
  sl.registerLazySingleton(() => UpdateItemsOfItemUseCase<TagEntity>(sl()));
  sl.registerLazySingleton(() => UpdateTaskUserLinkUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserItemsOfTaskUseCase(sl()));

  // Task Use cases
  sl.registerLazySingleton(() => GetItemsFromLogInUserUseCase<TaskDto>(sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetTaskItemsByIdSetUseCase(sl()));
  sl.registerLazySingleton(() => AddItemUseCase<TaskDto>(sl(), itemsType));
  sl.registerLazySingleton(() => UpdateItemUseCase<TaskDto, TaskParams>(sl()));
  sl.registerLazySingleton(() => UpdateTaskDtoUseCase(sl()));
  sl.registerLazySingleton(() => DeleteItemsUseCase<TaskDto>(sl(), itemsType));
  sl.registerLazySingleton(() => TaskFilterUseCase());
  sl.registerLazySingleton(() => TaskSortUseCase());

  // Task BLoCs
  sl.registerFactory(() => TaskBloc(
        addTask: sl(),
        deleteTask: sl(),
        sortTasksUseCase: sl(),
        filterTasksUseCase: sl(),
        updateTaskDtoUseCase: sl(),
        getTasks: sl(),
        exportTaskToExcelUseCase: sl(),
      ));

  sl.registerFactory(() => TaskFormCubit());
  sl.registerFactory(() => TaskUserLinkBloc(
        getUserItemsByTaskIdUseCase: sl(),
        updateLinkItemsOfItemUseCase: sl(),
      ));
  sl.registerFactory(() => TaskTagLinkBloc(
        getTagsByTaskId: sl(),
        updateTagItemsOfTask: sl(),
      ));
  sl.registerFactory(() => TaskReminderLinkBloc(
        getRemindersByTaskId: sl(),
        updateReminderItemsOfTask: sl(),
      ));
  sl.registerFactory(() => ItemLinkItemsBloc<TagEntity>(
        getUserItemsByTaskIdUseCase: sl(),
        updateLinkItemsOfItemUseCase: sl(),
      ));

  // Task Export Service
  sl.registerLazySingleton(() => ExportTaskToExcelUseCase(sl()));
}
