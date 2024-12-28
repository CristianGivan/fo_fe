import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskEntityLazyLoaded extends TaskEntity {
  UserEntity? creator;
  OrganizerItems<UserEntity>? userItems;
  OrganizerItems<TagEntity>? tagItems;
  OrganizerItems<ReminderEntity>? reminderItems;

  TaskEntityLazyLoaded({
    required int super.id,
    required String super.subject,
    required DateTime super.createdDate,
    required int super.creatorId,
    super.remoteId,
    super.lastUpdate,
    super.lastViewDate,
    super.remoteViews,
    super.views,
    super.checksum,
    super.startDate,
    super.endDate,
    super.workingTime,
    super.estimatedTime,
    super.estimatedLeftTime,
    super.workingProgress,
    super.taskStatus,
    this.creator,
    this.userItems,
    this.tagItems,
    this.reminderItems,
  });

  @override
  List<Object?> get props => super.props..addAll([creator, userItems, tagItems, reminderItems]);
}
