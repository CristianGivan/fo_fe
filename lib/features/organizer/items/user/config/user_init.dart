import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/user_usecase_export.dart';
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
  sl.registerLazySingleton(() => GetUserItemsAll(sl()));
  sl.registerLazySingleton(() => GetUserItemsByIdSet(sl()));
  sl.registerLazySingleton(() => GetUserItemsByUserId(sl()));
  sl.registerLazySingleton(() => InsertUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));

  // User BLoCs
  sl.registerFactory(() => UserBlocUser(
        insertUser: sl(),
        updateUser: sl(),
        deleteUser: sl(),
        getUserById: sl(),
        getUserItemsAll: sl(),
        getUserItemsByIdSet: sl(),
        getUserItemsByUserId: sl(),
        addUserToUser: sl(),
        deleteUserFromUser: sl(),
      ));
}
