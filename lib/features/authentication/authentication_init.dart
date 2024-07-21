import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/core/db/encrypt/encryption_service.dart';
import 'package:fo_fe/core/util/token_manager.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/data/repositories/authentication_repository_drift.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void authenticationInit() {
  // Register EncryptionService
  sl.registerLazySingleton<EncryptionService>(() => Base64EncryptionService());

  // Register TokenManager with EncryptionService as a dependency
  sl.registerLazySingleton(() => TokenManager(sl<EncryptionService>()));

  // Register AuthenticationLocalDataSource
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceDrift(
        database: sl<AuthenticationDriftDB>()),
  );

  // Register AuthenticationRepository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryDrift(
      localDataSource: sl<AuthenticationLocalDataSource>(),
      tokenManager: sl<TokenManager>(),
    ),
  );

  // Register UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl(), sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  sl.registerLazySingleton(() => AutoLoginUseCase(sl()));
  sl.registerLazySingleton(() => GetLoggedInUserIdUseCase(sl()));
  sl.registerLazySingleton(() => SwitchUserUseCase(sl()));
}
