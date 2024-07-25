import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void appInit() {
  coreInit();
  externalsInit();
  authenticationInit();
  organizerInit();
}

void coreInit() {
  // Util
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton(() => DeviceInfo());
  sl.registerLazySingleton<EncryptionService>(() => Base64EncryptionService());
  sl.registerLazySingleton(() => TokenManager(sl<EncryptionService>()));

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
}

void externalsInit() {
  // External dependencies
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
