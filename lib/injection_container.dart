import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_by_id.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/db/drift_sqlite/organizer_drift_db.dart';
import 'features/organizer/items/task/data/drift/datasourece/task_dao_drift.dart';
import 'features/organizer/items/task/data/drift/repositories/task_repositories_drift.dart';
import 'features/organizer/items/task/data/other/datasources/task_local_data_source.dart';
import 'features/organizer/items/task/data/other/datasources/task_remote_data_source.dart';
import 'features/organizer/items/task/data/other/datasources/task_sync_data_source.dart';
import 'features/organizer/items/task/data/other/repositories/task_repositories_impl.dart';
import 'features/organizer/items/task/domain/repositories/task_repository.dart';

final sl = GetIt.instance; //service locator

void init() {
  initFeature();
  initCore();
  initExternals();
  initDb();
}

void initFeature() {
  // Bloc
  sl.registerFactory(() => TaskBloc(
        getTaskById: sl(),
        inputConverter: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetTaskById(sl()));

  // Repositories
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
        networkInfo: sl(),
        taskLocalDataSource: sl(),
        taskSyncDataSource: sl(),
      ));
  sl.registerLazySingleton<TaskRepositoriesDrift>(
      () => TaskRepositoriesDrift(sl()));

  //Data source
  sl.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl());
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl(
        httpClient: sl(),
      ));
  sl.registerLazySingleton<TaskSyncDataSource>(() => TaskSyncDataSourceImpl(
        taskLocalDataSource: sl(),
        taskRemoteDataSource: sl(),
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
  sl.registerSingleton<OrganizerDriftDB>(OrganizerDriftDB());
  sl.registerSingleton<TaskDaoDrift>(sl<OrganizerDriftDB>().taskDaoDrift);
}
