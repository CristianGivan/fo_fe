import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_init.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

void organizerInit() {
  taskInit();
  userInit();
  reminderInt();
  tagInit();
}
