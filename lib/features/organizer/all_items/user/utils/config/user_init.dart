import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/usecases/get_user_and_linked_user_items.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/usecases/get_user_items_by_user_id_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/usecases/user_usecase_export.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
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
  sl.registerLazySingleton(() => AddUserToUserUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));
  sl.registerLazySingleton(() => DeleteUserFromUser(sl()));
  sl.registerLazySingleton(() => GetUserByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetLinkedUserItems(sl(), sl()));
  sl.registerLazySingleton(() => GetUserItemsByIdSet(sl()));
  sl.registerLazySingleton(() => GetUserItemsByUserId(sl()));
  sl.registerLazySingleton(() => AddUserUseCase(sl()));
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
        getUserAndLinkedUserItems: sl(),
      ));

  sl.registerFactory(() => UserValidationBloc());
}
