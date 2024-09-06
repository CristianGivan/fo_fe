import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    super.id,
    super.createdDate,
    super.creatorId,
    super.remoteId,
    super.lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    super.checksum,
    required String super.subject,
    super.startDate,
    super.endDate,
    super.workingTime,
    super.estimatedTime,
    super.estimatedLeftTime,
    super.workingProgress,
    super.taskStatus,
  }) : super(
          lastViewDate: lastAccessedDate,
          remoteViews: remoteAccesses,
          views: accesses,
        );

  // Example method to calculate a property or add custom logic
  String get displayTitle => "$subject (Due: ${endDate?.toLocal()})";
}
