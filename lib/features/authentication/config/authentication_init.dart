import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/authentication/data/repositories/authentication_repository_drift.dart';
import 'package:fo_fe/features/authentication/utils/token_manager.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void authenticationInit() {
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
      deviceInfo: sl<DeviceInfo>(),
    ),
  );

  // Register UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl(), sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  sl.registerLazySingleton(() => AutoLoginUseCase(sl()));
  sl.registerLazySingleton(() => GetLoggedInUserIdUseCase(sl()));
  sl.registerLazySingleton(() => SwitchUserUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl(), sl()));

  // Register BLoCs
  sl.registerFactory(() => AuthenticationBlocSession(
        autoLoginUseCase: sl<AutoLoginUseCase>(),
        getLoggedInUserIdUseCase: sl<GetLoggedInUserIdUseCase>(),
        switchUserUseCase: sl<SwitchUserUseCase>(),
      ));
  sl.registerFactory(() => AuthenticationBlocToken(
        logoutUseCase: sl<LogoutUseCase>(),
        refreshTokenUseCase: sl<RefreshTokenUseCase>(),
      ));
  sl.registerFactory(() => AuthenticationBlocSignUp(
        signUpUseCase: sl<SignUpUseCase>(),
      ));
  sl.registerFactory(() => AuthenticationBlocSignIn(
        loginUseCase: sl<LoginUseCase>(),
      ));
}
