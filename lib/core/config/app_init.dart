import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/auth/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/functions/simple_bloc_observer.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void appInit({bool isDev = false}) {
  WidgetsFlutterBinding.ensureInitialized();
  if (isDev) {
    Bloc.observer = SimpleBlocObserver();
  }
  coreInit();
  externalsInit();
  driftDbInit(isDev: isDev);
  authInit();
  organizerInit();
}

void coreInit() {
  // Util
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton(() => const DeviceInfo());
  sl.registerLazySingleton<EncryptionService>(() => Base64EncryptionService());
  sl.registerLazySingleton(() => TokenManager(sl<EncryptionService>()));

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
}

void externalsInit() {
  // External dependencies
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
