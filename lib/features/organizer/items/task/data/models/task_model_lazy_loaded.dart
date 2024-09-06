import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_model.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class TaskModelLazyLoaded extends TaskModel {
  final UserModel? creator;
  final OrganizerItems<UserModel>? userItems;
  final OrganizerItems<TagModel>? tagItems;
  final OrganizerItems<ReminderModel>? reminderItems;

  TaskModelLazyLoaded({
    required int super.id,
    required super.subject,
    required DateTime super.createdDate,
    required super.creatorId,
    super.remoteId,
    super.lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
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
  }) : super(
          lastAccessedDate: lastViewDate,
          remoteAccesses: remoteViews,
          accesses: views,
        );

  @override
  List<Object?> get props =>
      super.props + [creator, userItems, tagItems, reminderItems];
}
