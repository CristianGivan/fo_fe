import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_model.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';
import 'package:fo_fe/features/organizer/util/organizer_enums.dart';

class TaskModelLazyLoaded extends TaskModel {
  final UserModel? creator;
  final List<UserModel>? userList;
  final List<TagModel>? tagList;
  final List<ReminderModel>? reminderList;

  TaskModelLazyLoaded({
    required int id,
    required String subject,
    required DateTime createdDate,
    required int creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
    this.creator,
    this.userList,
    this.tagList,
    this.reminderList,
  }) : super(
          id: id,
          subject: subject,
          createdDate: createdDate,
          creatorId: creatorId,
          remoteId: remoteId,
          lastUpdate: lastUpdate,
          lastAccessedDate: lastViewDate,
          remoteAccesses: remoteViews,
          accesses: views,
          checksum: checksum,
          startDate: startDate,
          endDate: endDate,
          workingTime: workingTime,
          estimatedTime: estimatedTime,
          estimatedLeftTime: estimatedLeftTime,
          workingProgress: workingProgress,
          taskStatus: taskStatus,
        );

  @override
  List<Object?> get props =>
      super.props + [creator, userList, tagList, reminderList];
}
