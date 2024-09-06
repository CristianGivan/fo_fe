import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

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
  List<Object?> get props =>
      super.props..addAll([creator, userItems, tagItems, reminderItems]);
}
