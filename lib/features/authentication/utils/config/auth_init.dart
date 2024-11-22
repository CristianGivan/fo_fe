import 'package:fo_fe/core/db/drift/auth_drift_db.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/data/repositories/auth_repository_drift.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
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
  sl.registerLazySingleton(() => LogInUseCase(sl(), sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  sl.registerLazySingleton(() => LogInAutoUseCase(sl()));
  sl.registerLazySingleton(() => GetSignInUserUseCase(sl()));
  sl.registerLazySingleton(() => LogSwitchUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl(), sl()));

  // Register BLoCs
  sl.registerFactory(() => AuthLogBloc(
        logInUseCase: sl<LogInUseCase>(),
        logInAutoUseCase: sl<LogInAutoUseCase>(),
        logOutUseCase: sl<LogOutUseCase>(),
        logSwitchUseCase: sl<LogSwitchUseCase>(),
      ));
  sl.registerFactory(() => AuthTokenBloc(
        logoutUseCase: sl<LogOutUseCase>(),
        refreshTokenUseCase: sl<RefreshTokenUseCase>(),
      ));

  sl.registerFactory(() => SignUpBloc(
        signUpUseCase: sl<SignUpUseCase>(),
      ));
}
