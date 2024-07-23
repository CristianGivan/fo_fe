import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/db/encrypt/encryption_service.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/DeviceInfo.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/core/util/token_manager.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  coreInit();
  externalsInit();
  authenticationInit();
  driftDbInit();
  taskInit();
  tagInit();
  userInit();
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
