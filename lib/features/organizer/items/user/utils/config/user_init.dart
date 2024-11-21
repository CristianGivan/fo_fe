import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/get_user_items_by_user_id_use_case.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/user_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void userInit() {
  // User Data Source
  sl.registerLazySingleton<UserLocalDataSourceDrift>(
      () => UserLocalDataSourceDrift(db: sl<OrganizerDriftDB>()));

  // User Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryDrift(
        localDataSource: sl<UserLocalDataSourceDrift>(),
      ));

  // User Use cases
  sl.registerLazySingleton(() => AddUserToUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));
  sl.registerLazySingleton(() => DeleteUserFromUser(sl()));
  sl.registerLazySingleton(() => GetUserById(sl()));
  sl.registerLazySingleton(() => GetConnectedUserItems(sl(), sl()));
  sl.registerLazySingleton(() => GetUserItemsByIdSet(sl()));
  sl.registerLazySingleton(() => GetUserItemsByUserId(sl()));
  sl.registerLazySingleton(() => AddUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));

  // User BLoCs
  sl.registerFactory(() => UserBloc(
        addUser: sl(),
        updateUser: sl(),
        deleteUser: sl(),
        getUserById: sl(),
        addUserToUser: sl(),
        deleteUserFromUser: sl(),
        getUserItemsByIdSet: sl(),
        getUserItemsByUserId: sl(),
        getUserAndConnectedUserItems: sl(),
      ));

  sl.registerFactory(() => UserValidationBloc());
}
