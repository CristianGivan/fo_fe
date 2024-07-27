import 'package:fo_fe/features/organizer/items/reminder/config/reminder_init.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

void organizerInit() {
  taskInit();
  tagInit();
  userInit();
  reminderInt();
}
