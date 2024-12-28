import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
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
  // sl.registerLazySingleton<OrganizerBloc>(() => OrganizerBloc(
  //       fetchItems: sl(),
  //       addItem: sl(),
  //       updateItem: sl(),
  //       deleteItem: sl(),
  //     ));
}
