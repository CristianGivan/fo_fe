import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/db/encrypt/encryption_service.dart';
import 'package:fo_fe/core/util/DeviceInfo.dart';
import 'package:fo_fe/core/util/token_manager.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/data/repositories/authentication_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

init1() {
  // Initialize GetIt

  AuthenticationDriftDB authenticationDriftDB = AuthenticationDriftDB();
  AuthenticationLocalDataSourceDrift authenticationLocalDataSourceDrift =
      AuthenticationLocalDataSourceDrift(database: authenticationDriftDB);
  EncryptionService encryptionService = Base64EncryptionService();
  TokenManager tokenManager = TokenManager(encryptionService);
  DeviceInfo deviceInfo = DeviceInfo(device: "device1", deviceUser: "devuser1");
  AuthenticationRepository authRepository = AuthenticationRepositoryDrift(
      localDataSource: authenticationLocalDataSourceDrift,
      tokenManager: tokenManager,
      deviceInfo: deviceInfo);

  OrganizerDriftDB db = OrganizerDriftDB();
  UserDaoDrift userDaoDrift = UserDaoDrift(db);
  UserUserDaoDrift userUserDaoDrift = UserUserDaoDrift(db);
  UserLocalDataSourceDrift userLocalDataSourceDrift = UserLocalDataSourceDrift(
      userDao: userDaoDrift, userUserDao: userUserDaoDrift);
  UserRepository userRepository =
      UserRepositoryDrift(localDataSourceDrift: userLocalDataSourceDrift);

  // Register the SignUpUseCase with GetIt
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepository, userRepository));
}
