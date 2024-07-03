import 'package:fo_fe/features/organizer/items/task/domain/entities/user.dart';

import '../../../../organizer.dart';
import '../../../../util/organizer_enums.dart';
import '../../../tag/tag_lib.dart';
import '../../task_lib.dart';

class TaskEntityLazyLoaded extends TaskEntity {
  User? creator;
  List<User>? userList;
  List<Tag>? tagList;
  List<Reminder>? reminderList;

  TaskEntityLazyLoaded({
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
          lastViewDate: lastViewDate,
          remoteViews: remoteViews,
          views: views,
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
      super.props..addAll([creator, userList, tagList, reminderList]);
}
