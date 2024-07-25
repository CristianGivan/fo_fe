import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

void organizerInit() {
  driftDbInit();
  taskInit();
  tagInit();
  userInit();
}
