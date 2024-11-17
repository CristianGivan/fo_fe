import 'package:fo_fe/core/db/drift/auth_drift_db.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/data/repositories/auth_repository_drift.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void authInit() {
  // Register AuthLocalDataSource
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceDrift(database: sl<AuthDriftDB>()),
  );

  // Register AuthRepository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryDrift(
      localDataSource: sl<AuthLocalDataSource>(),
      tokenManager: sl<TokenManager>(),
      deviceInfo: sl<DeviceInfo>(),
    ),
  );

  // Register UseCases
  sl.registerLazySingleton(() => SigInUseCase(sl(), sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  sl.registerLazySingleton(() => SignInAutoUseCase(sl()));
  sl.registerLazySingleton(() => GetSignInUserIdUseCase(sl()));
  sl.registerLazySingleton(() => SwitchUserUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl(), sl()));

  // Register BLoCs
  sl.registerFactory(() => AuthSignBloc(
        signUpUseCase: sl<SignUpUseCase>(),
        sigInUseCase: sl<SigInUseCase>(),
        signInAutoUseCase: sl<SignInAutoUseCase>(),
        signOutUseCase: sl<SignOutUseCase>(),
        switchUserUseCase: sl<SwitchUserUseCase>(),
        getLoggedInUserIdUseCase: sl<GetSignInUserIdUseCase>(),
      ));
  sl.registerFactory(() => AuthTokenBloc(
        logoutUseCase: sl<SignOutUseCase>(),
        refreshTokenUseCase: sl<RefreshTokenUseCase>(),
      ));
}
