import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/domain/usecases/get_entities_from_user_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void organizerInit() {
  taskInit();
  userInit();
  reminderInt();
  tagInit();
  organizerBloc();
}

void organizerBloc() {
  sl.registerLazySingleton(() => GetEntitiesFromUserUseCase(sl(), sl(), sl()));
}
