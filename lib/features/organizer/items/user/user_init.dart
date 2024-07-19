import 'package:fo_fe/features/organizer/items/user/data/repositories/user_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/user_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initUser() {
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

  // User Use cases
  sl.registerLazySingleton(() => InsertUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));
  sl.registerLazySingleton(() => GetUserById(sl()));
  sl.registerLazySingleton(() => GetUserItemsAll(sl()));
  sl.registerLazySingleton(() => GetUserItemsByIdSet(sl()));

  // User Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryDrift(
        localDataSourceDrift: sl<UserLocalDataSourceDrift>(),
      ));

  // User Data Source
  sl.registerLazySingleton<UserLocalDataSourceDrift>(
      () => UserLocalDataSourceDrift(userDao: sl(), userUserDao: sl()));
}
