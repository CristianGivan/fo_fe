import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_sync.dart';
import 'package:fo_fe/features/organizer/elements/task/data/repositories/task_repositories_impl.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/usecases/get_task_by_id.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; //service locator

void init() {
  initFeature();
  initCore();
  initExternals();
}

void initFeature() {
  // Bloc
  sl.registerFactory(() => TaskBloc(
        getTaskById: sl(),
        inputConverter: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetTaskById(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
        taskLocalDataSource: sl(),
        taskSync: sl(),
        networkInfo: sl(),
      ));

  //Data source
  sl.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl());
  sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl(
        httpClient: sl(),
      ));
  sl.registerLazySingleton(() => TaskSyncImpl(
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
