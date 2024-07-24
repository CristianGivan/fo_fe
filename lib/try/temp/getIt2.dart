import 'package:fo_fe/main_init.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

init2() {
  // Initialize GetIt
  init();

  // Register the SignUpUseCase with GetIt
  // sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl(), sl()));
}
