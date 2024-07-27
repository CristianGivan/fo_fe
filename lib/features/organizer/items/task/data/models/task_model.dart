import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    String? checksum,
    required String subject,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
  }) : super(
          id: id,
          subject: subject,
          createdDate: createdDate,
          creatorId: creatorId,
          remoteId: remoteId,
          lastUpdate: lastUpdate,
          lastViewDate: lastAccessedDate,
          remoteViews: remoteAccesses,
          views: accesses,
          checksum: checksum,
          startDate: startDate,
          endDate: endDate,
          workingTime: workingTime,
          estimatedTime: estimatedTime,
          estimatedLeftTime: estimatedLeftTime,
          workingProgress: workingProgress,
          taskStatus: taskStatus,
        );

  // Example method to calculate a property or add custom logic
  String get displayTitle => "$subject (Due: ${endDate?.toLocal()})";
}
