import 'package:fo_fe/core/db/drift/auth_drift_db.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/data/repositories/auth_repository_drift.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_user_bloc/auth_user_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_in_auto_bloc/sign_in_auto_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_out_bloc/sign_out_bloc.dart';
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
  sl.registerLazySingleton(() => SigInUseCase(sl(), sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  sl.registerLazySingleton(() => SignInAutoUseCase(sl()));
  sl.registerLazySingleton(() => GetSignInUserUseCase(sl()));
  sl.registerLazySingleton(() => SwitchUserUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl(), sl()));

  // Register BLoCs
  sl.registerFactory(() => AuthSignBloc(
        sigInUseCase: sl<SigInUseCase>(),
        signInAutoUseCase: sl<SignInAutoUseCase>(),
        signOutUseCase: sl<SignOutUseCase>(),
        switchUserUseCase: sl<SwitchUserUseCase>(),
      ));
  sl.registerFactory(() => AuthTokenBloc(
        logoutUseCase: sl<SignOutUseCase>(),
        refreshTokenUseCase: sl<RefreshTokenUseCase>(),
      ));
  sl.registerFactory(() => AuthUserBloc(
        getSignInUserUseCase: sl<GetSignInUserUseCase>(),
      ));

  sl.registerFactory(() => SignInAutoBloc(
        signInAutoUseCase: sl<SignInAutoUseCase>(),
      ));
  sl.registerFactory(() => SignInBloc(
        sigInUseCase: sl<SigInUseCase>(),
      ));
  sl.registerFactory(() => SignOutBloc(
        signOutUseCase: sl<SignOutUseCase>(),
      ));
  sl.registerFactory(() => SignUpBloc(
        signUpUseCase: sl<SignUpUseCase>(),
      ));
}
